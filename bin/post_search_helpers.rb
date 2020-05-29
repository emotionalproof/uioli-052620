require "tty-prompt"




def select_recipes(results_aoh)
    prompt = TTY::Prompt.new
    choices = {}
    results_aoh.each do |hash|
        choices[hash["name"]] = hash
    end
    prompt.multi_select("\n\n\n\n\n\n\n\n\n\nWe have the results of your Use It Or Lose It Search!"\
    "\n\nWhich of these recipes would you like to"\
        " add to your cookbook?\n\n", choices) 
end 


# selected_recipes is an array of hashes
def finalize_recipes(selected_recipes_aoh)
    prompt = TTY::Prompt.new
    array_recipe_names = selected_recipes_aoh.map do |recipe_hash|
                            recipe_hash["name"]
                            end
    string_recipes = array_recipe_names.join(", ")
    continue = prompt.yes?("\n\n\n\n\n\n\n\n\n\n\n\n\nGreat, you picked:\n\n#{string_recipes}.\n\nIf you would like to"\
    " add the recipe(s) to your cookbook, enter: Y.\n\nIf you would like"\
    " to re-select your recipes, enter: n")
end

def cookbook(cookbook_array_of_hashes)
    prompt = TTY::Prompt.new
    choices = {}
    cookbook_array_of_hashes.map do |hash|
        choices[hash["name"]] = hash
    end
    prompt.select("\n\n\n\n\n\n\n\n\n\n\nGreat, you now have some recipes, but, if you've been with us before,"\
    "\nyou may want to pivot and select something else from your cookbook."\
        "\n\nLet's decide on the one meal we are cooking today so we can make a shopping list:\n\n", choices) 
end

def cookbook_redo(cookbook_array_of_hashes)
    prompt = TTY::Prompt.new
    choices = {}
    cookbook_array_of_hashes.map do |hash|
        choices[hash["name"]] = hash
    end
    prompt.select("\n\n\n\n\n\n\n\n\n\n\nAlright, let's try this again.\n"\
        "\nLet's decide which recipe you are cooking today so we can make a shopping list:\n\n", choices) 
end

def finalize_cookbook(selected_recipe_hash)
    prompt = TTY::Prompt.new
    string_recipe = selected_recipe_hash["name"]
    continue = prompt.yes?("\n\n\n\n\n\n\n\n\n\n\nGreat, you picked:\n\n#{string_recipe}.\n\nIf you would like to"\
    " move onto your Shopping List, enter: Y.\nIf you would like"\
    " to re-select your recipe, enter: n")
end

def get_source_website(api_source_website_by_recipe_id)
    api_get = api_source_website_by_recipe_id
    "You can read the full recipe and detailed instructions at #{api_get["sourceUrl"]}"
end

def get_recipe_instructions(api_instructions_by_recipe_id)
        instructions_array = []
        api_get = api_instructions_by_recipe_id
        api_get.reverse.each do |instruction|
            instruction["steps"].each do |step|
                instructions_array << step["step"]
            end
        end
        instructions_array
    end


def get_recipe_ingredients(api_ingredients_by_recipe_id)
    array = [] 
    api_get = api_ingredients_by_recipe_id
     api_get["ingredients"].each do |ingredient| 
         array << "#{ingredient["amount"]["us"]["value"]} #{ingredient["amount"]["us"]["unit"]} of #{ingredient["name"]}"
     end
     array
 end

 def goodbye(selected_recipe_name, recipe_ingredients_from_api, recipe_source_from_api, recipe_instructions_from_api, youtube_input)
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts
    puts "Great! You are about to cook #{selected_recipe_name}!"
    puts 
    puts "Use It Or Lose It! will try to utilize all of the ingredients on your chopping block"
    puts "but you may need more items before you are chowing down on #{selected_recipe_name}."
    puts
    puts "Below, you will find a complete list of ingredients(with quantities)"
    puts "as well as instructions on how to prepare, cook, and serve this amazing dish."
    puts
    puts "INGREDIENTS:"
    "#{recipe_ingredients_from_api.each {|item| puts item}}"
    puts
    puts "INSTRUCTIONS"
    puts "#{recipe_source_from_api}"
    "#{recipe_instructions_from_api.each {|step| puts step}}"
    puts
    puts "For video instruction and guides to similar recipes, click here to the link below"
    puts "https://www.youtube.com/results?search_query=#{youtube_input}"
    puts "Until the next time you fear that you will Lose It..."
    puts "We appreciate you for choosing to Use It."
    puts "Thank you!"
 end