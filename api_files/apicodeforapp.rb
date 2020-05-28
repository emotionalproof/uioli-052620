require_relative './GetRequester.rb'


#Get Recipe by ingredienets

uioli_item_array = []
uioli_items = uioli_item_array.join(",")

get_recipe_by_ingredients_url = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=64dca65eeac74ce69073e6e23ff32ae9&ingredients=#{uioli_items}&number=10&ranking=2"
api_recipe_by_ingredients = GetRequester.new(get_recipe_by_ingredients_url).parse_json

def get_recipe_by_ingredients(api_recipe_by_ingredients)
    api_get = api_recipe_by_ingredients
    recipe_array =[]
    
    api_get.each do |recipe|
        recipe_hash = {}
        recipe_hash["name"] = recipe["title"]
        recipe_hash["website_id"] = recipe["id"]
        recipe_array << recipe_hash
    end
    recipe_array
end





api_recipe_id = selected_recipe_hash[webiste_id]

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


def get_source_website(api_source_website_by_recipe_id)
    api_get = api_source_website_by_recipe_id
    puts "You can read the full recipe and detailed instructions at #{api_get["sourceUrl"]}"
end
