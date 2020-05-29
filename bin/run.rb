
require_relative '../config/environment.rb'

# require_relative './bin/app/models/user.rb'
# require_relative './bin/app/models/pantry_item.rb'
# require_relative './bin/app/models/cookbook.rb'
# require_relative './cli_models/getrequester.rb'
require_all 'lib'
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
puts "/A  /A  /A  /A"
puts "|@| |@| |@| |@|"
puts "|@| |@| |@| |@|  #    #                          #####     #"
puts "|@| |@| |@| |@|  #    #                            #       #"
puts "|@| |@| |@| |@|  #    #   #####   ####             #     #####"
puts "|@| |@| |@| |@|  #    #  #       #    #            #       #   "
puts "|@| |@| |@| |@|  #    #   ####   ######            #       #   "
puts "|@| |@| |@| |@|  #    #       #  #                 #       #    "
puts "|@| |@| |@| |@|   ####   #####    ####           #####      ###  "
puts "|@^V=@ V @ V@^| "
puts " @@@@@@@@@@@@/ "  
puts "  @@@@@@@@@@/                       ## "          
puts "   @@@@@@@@/`                      #  # "         
puts "    ||=@@|/                        #    #  # ###"  
puts "    ||@@@|                         #    #  ##"     
puts "    ||@@@|                         #    #  #"      
puts "    ||@@@|                          #  #   #"      
puts "    ||@@@|                           ##    #"      
puts "    ||@@@|  "                                                                       
puts "    ||@@@|  #                                       #####     #       #"    
puts "    ||@@@|  #                                         #       #       #"   
puts "    ||@@@|  #        ####    #####   ####             #     #####     #"   
puts "    ||@@@|  #       #    #  #       #    #            #       #       #"   
puts "    ||@@@|  #       #    #   ####   ######            #       #       #"   
puts "    ||@@@|  #       #    #       #  #                 #       #"           
puts "    ||@@@|  #####    ####   #####    ####           #####      ###    #"   
puts "    ||@@@|  "
puts "    ||@@@|  "
puts "    ||@@@|  "
puts "    ||@@@|  "
puts "   (@@@@@@) "

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
cookbook_array_of_hashes = this_user.recipes_into_aoh

selected_recipe = cookbook(cookbook_array_of_hashes)
choice = finalize_cookbook(selected_recipe)
    until choice == true
        selected_recipe = cookbook_redo(cookbook_array_of_hashes)
        choice = finalize_cookbook(selected_recipe)
    end

    #pull the website_id from the selected recipe hash
    website_id = selected_recipe["website_id"]

api_recipe_id = website_id 



ingredients_by_recipe_id_url = "https://api.spoonacular.com/recipes/#{api_recipe_id}/ingredientWidget.json?apiKey=64dca65eeac74ce69073e6e23ff32ae9"
instructions_by_recipe_id_url = "https://api.spoonacular.com/recipes/#{api_recipe_id}/analyzedInstructions?apiKey=64dca65eeac74ce69073e6e23ff32ae9"
source_website_by_recipe_id_url = "https://api.spoonacular.com/recipes/#{api_recipe_id}/information?apiKey=64dca65eeac74ce69073e6e23ff32ae9"

api_ingredients_by_recipe_id = GetRequester.new(ingredients_by_recipe_id_url).parse_json
api_instructions_by_recipe_id = GetRequester.new(instructions_by_recipe_id_url).parse_json
api_source_website_by_recipe_id = GetRequester.new(source_website_by_recipe_id_url).parse_json

recipe_ingredients_from_api = get_recipe_ingredients(api_ingredients_by_recipe_id)
recipe_instructions_from_api = get_recipe_instructions(api_instructions_by_recipe_id)
recipe_source_from_api = get_source_website(api_source_website_by_recipe_id)

goodbye(selected_recipe["name"], recipe_ingredients_from_api, recipe_source_from_api, recipe_instructions_from_api)

