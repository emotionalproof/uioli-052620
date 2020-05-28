require_relative './getrequester.rb'

# uioli_item_array = []

# items.each do |item|
#    if selected == true
#       uioli_item_array << item
#    end
# end

# test itme array 
uioli_item_array = ["teriyaki", "chicken", "broccoli"]

uioli_items = uioli_item_array.join(",")

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

recipe_array = get_recipe_by_ingredients(api_recipe_by_ingredients)

selected_recipe_name = "Teriyaki Glazed Chicken Hindquarters"

def get_website_id(recipe_array, selected_recipe_name)
   recipe_array.each do |recipe| 
      if recipe["name"] == selected_recipe_name 
         return recipe["website_id"]
      end
   end
end

selected_recipe_website_id = get_website_id(recipe_array, selected_recipe_name)

api_recipe_id = selected_recipe_website_id 

ingredients_by_recipe_id_url = "https://api.spoonacular.com/recipes/#{api_recipe_id}/ingredientWidget.json?apiKey=64dca65eeac74ce69073e6e23ff32ae9"
instructions_by_recipe_id_url = "https://api.spoonacular.com/recipes/#{api_recipe_id}/analyzedInstructions?apiKey=64dca65eeac74ce69073e6e23ff32ae9"
source_website_by_recipe_id_url = "https://api.spoonacular.com/recipes/#{api_recipe_id}/information?apiKey=64dca65eeac74ce69073e6e23ff32ae9"

api_ingredients_by_recipe_id = GetRequester.new(ingredients_by_recipe_id_url).parse_json
api_instructions_by_recipe_id = GetRequester.new(instructions_by_recipe_id_url).parse_json
api_source_website_by_recipe_id = GetRequester.new(source_website_by_recipe_id_url).parse_json


def get_recipe_ingredients(api_ingredients_by_recipe_id)
    api_get = api_ingredients_by_recipe_id
    api_get["ingredients"].each do |ingredient| 
        puts "#{ingredient["amount"]["us"]["value"]} #{ingredient["amount"]["us"]["unit"]} of #{ingredient["name"]}"
    end
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
    puts "You can read the full recipe and detailed instructions at #{api_get["sourceUrl"]}"
end

recipe_source_from_api = get_source_website(api_source_website_by_recipe_id)


def shopping_list(selected_recipe_name, recipe_source_from_api, recipe_ingredients_from_api, recipe_instructions_from_api)
    # recipe_name = selected_recipe_hash["name"]
    # recipe_url = selected_recipe_hash["url"]
    #how do I list out the returned ingredients
    puts "Great! You are about to cook #{selected_recipe_name}!"\
    "\n\nUse It Or Lose It! will try to utilize all of the ingredients on your chopping block"\
    "\n\nbut you may need more items before you are chowing down on #{selected_recipe_name}."\
    "\n\nBelow, you will find a complete list of ingredients(with quantities)"
    "\n\nas well as instructions on how to prepare, cook, and serve this amazing dish."\
    "\n\nINGREDIENTS:"
    "\n\n#{recipe_ingredients_from_api}"\
    "\n\nINSTRUCTIONS"\
    "\n\nY#{recipe_source_from_api}"\
    "\n\n#{recipe_instructions_from_api}\n"\
    "\n\nThank you!\n\nUntil the next time you fear that you will Lose It...\n\n"\
    "We appreciate you for choosing to Use It.\n\n"\
end