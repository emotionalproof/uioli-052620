# require_relative '../config/environment'
# require 'pry'
require "tty-prompt"
require './bin/cli_models/pre_search_helpers.rb'
require './bin/cli_models/post_search_helpers.rb'
require './bin/app/models/user.rb'
require './bin/app/models/pantry_item.rb'
require './bin/app/models/cookbook.rb'
require_relative './getrequester.rb'


username = user_name

if User.find_by(username: username)
    go_on = user_continue(username)
    until go_on == true
        username = user_name
        if User.find_by(username: username)
            go_on = user_continue(username)
        else
            go_on = create_username(username)
        end
    end
else
    go_on = create_username(username)
    until go_on == true
        username = user_name
        if User.find_by(username: username)
            go_on = user_continue(username)
        else
            go_on = create_username(username)
        end
    end
end

this_user = User.find_or_create_by(username: username)
this_user_id = this_user.id

if PantryItem.find_by(user_id: this_user_id)
    this_pantry = PantryItem.find_by(user_id: this_user_id)
    pantry_string = this_pantry.ingredients
    pantry_choices = returning_user_pantry(pantry_string)
else     
    pantry_choices = enter_new_pantry
end

choice = check_pantry(pantry_choices)

    until choice == "Continue"
        if choice == "Remove from Pantry"
            pantry_choices = remove_from_pantry(pantry_choices)
            choice = check_pantry(pantry_choices)
        elsif choice == "Add to Pantry"
            pantry_choices = add_to_pantry(pantry_choices)
            choice = check_pantry(pantry_choices)
        elsif choice == "Redo Pantry"    
            pantry_choices = enter_new_pantry
            choice = check_pantry(pantry_choices)
        elsif choice == "Quit"
            quit_uioli
        end
    end

this_pantry = PantryItem.find_or_create_by(user_id: this_user_id)
pantry_choices_string = pantry_choices.join(", ")
this_pantry.update(ingredients: pantry_choices_string)

uioli_array = select_uioli(pantry_choices)
decision = finalize_uioli(uioli_array)
    until decision == "Continue. I need to Use It before I Lose It."
        if decision == "Redo Selection"
            uioli_array = select_uioli(pantry_choices)
            decision = finalize_uioli(uioli_array)
        elsif decision == "Quit"
            quit_uioli
        else 
            uioli_array
        end
    end

uioli_array.each do |uioli_element|
    pantry_choices.delete(uioli_element)
    end
new_pantry_string = pantry_choices.join(", ")
this_pantry.update(ingredients: new_pantry_string)

#     uioli_array HOLDS THE NAMES OF THE INGREDIENTS FOR OUR SEARCH

#    results_aoh = result from the recipe search from the API
uioli_items = uioli_array.join(",")

get_recipe_by_ingredients_url = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=64dca65eeac74ce69073e6e23ff32ae9&ingredients=#{uioli_items}&number=10&ranking=2"
api_recipe_by_ingredients = GetRequester.new(get_recipe_by_ingredients_url).parse_json

def get_recipe_by_ingredients(api_recipe_by_ingredients)
    api_get = api_recipe_by_ingredients
    recipes =[]
    
    api_get.each do |recipe|
        recipe_hash = {}
        recipe_hash["name"] = recipe["title"]
        recipe_hash["website_id"] = recipe["id"]
        recipes << recipe_hash
    end
    recipes
end

results_aoh = get_recipe_by_ingredients(api_recipe_by_ingredients)

chosen_recipes_aoh = select_recipes(results_aoh)

 
continue = finalize_recipes(chosen_recipes_aoh)

    until continue == true
        chosen_recipes_aoh = select_recipes(results_aoh)
        continue = finalize_recipes(chosen_recipes_aoh)
    end


#     # here is where we create the Cookbooks, function in class Cookbook
Cookbook.create_cookbooks(chosen_recipes_aoh, this_user_id)

    
#         #here, we are taking all of the user recipes and turning them into 
#         #hashes in form [{"name"=>"string", "website_id"=>integer}]
cookbook_array_of_hashes = user.recipes_into_aoh

selected_recipe = cookbook(cookbook_array_of_hashes)
choice = finalize_cookbook(selected_recipe)
    until choice == true
        selected_recipe = cookbook_redo(cookbook_array_of_hashes)
        choice = finalize_cookbook(selected_recipe)
    end

    #pull the website_id from the selected recipe hash
    website_id = selected_recipe["website_id"]

# #then enter that information into the shopping_list 
# shopping_list(website_id)

# def get_website_id(recipe_array, selected_recipe_name)
#    recipe_array.each do |recipe| 
#       if recipe["name"] == selected_recipe_name 
#          return recipe["website_id"]
#       end
#    end
# end

api_recipe_id = website_id 

ingredients_by_recipe_id_url = "https://api.spoonacular.com/recipes/#{api_recipe_id}/ingredientWidget.json?apiKey=64dca65eeac74ce69073e6e23ff32ae9"
instructions_by_recipe_id_url = "https://api.spoonacular.com/recipes/#{api_recipe_id}/analyzedInstructions?apiKey=64dca65eeac74ce69073e6e23ff32ae9"
source_website_by_recipe_id_url = "https://api.spoonacular.com/recipes/#{api_recipe_id}/information?apiKey=64dca65eeac74ce69073e6e23ff32ae9"

api_ingredients_by_recipe_id = GetRequester.new(ingredients_by_recipe_id_url).parse_json
api_instructions_by_recipe_id = GetRequester.new(instructions_by_recipe_id_url).parse_json
api_source_website_by_recipe_id = GetRequester.new(source_website_by_recipe_id_url).parse_json


def get_recipe_ingredients(api_ingredients_by_recipe_id)
   array = [] 
   api_get = api_ingredients_by_recipe_id
    api_get["ingredients"].each do |ingredient| 
        array << "#{ingredient["amount"]["us"]["value"]} #{ingredient["amount"]["us"]["unit"]} of #{ingredient["name"]}"
    end
    array
end

recipe_ingredients_from_api = get_recipe_ingredients(api_ingredients_by_recipe_id)


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

recipe_instructions_from_api = get_recipe_instructions(api_instructions_by_recipe_id)



def get_source_website(api_source_website_by_recipe_id)
    api_get = api_source_website_by_recipe_id
    "You can read the full recipe and detailed instructions at #{api_get["sourceUrl"]}"
end

recipe_source_from_api = get_source_website(api_source_website_by_recipe_id)



# recipe_name = selected_recipe_hash["name"]
# recipe_url = selected_recipe_hash["url"]
#how do I list out the returned ingredients
def goodbye(selected_recipe_name, recipe_ingredients_from_api, recipe_source_from_api, recipe_instructions_from_api)
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
   puts
   puts "Until the next time you fear that you will Lose It..."
   puts "We appreciate you for choosing to Use It."
   puts "Thank you!"
end



