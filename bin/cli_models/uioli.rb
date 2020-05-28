require 'pry'
require "tty-prompt"
require './bin/cli_models/pre_search_helpers.rb'
require './bin/cli_models/post_search_helpers.rb'
# # require './bin/app/models/user.rb'
# # require './bin/app/models/pantry_item.rb'
# # require './bin/app/models/use_it_or_lose_it.rb'
# # require './bin/app/models/search.rb'
# # require './bin/app/models/api.rb'
# # require './bin/app/models/recipe.rb'
# # require './bin/app/models/ingredient.rb'
# # require './bin/app/models/cookbook.rb'
# # require './bin/app/models/shopping_list.rb'


username = user_name

if User.find_by(username: username) == true
    go_on = user_continue(username)
    until go_on == true
        username = user_name
        if User.find_by(username: username) == true
            go_on = user_continue(username)
        else
            go_on = create_username(username)
        end
    end
else
    go_on = create_username(username)
    until go_on == true
        username = user_name
        if User.find_by(username: username) == true
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

    #uioli_array HOLDS THE NAMES OF THE INGREDIENTS FOR OUR SEARCH

   #results_aoh = result from the recipe search from the API
 
chosen_recipes_aoh = select_recipes(results_aoh)
continue = finalize_recipes(chosen_recipes_aoh)
    until continue == true
        chosen_recipes_aoh = select_recipes(results_aoh)
        continue = finalize_recipes(chosen_recipes_aoh)
    end

    # here is where we create the Cookbooks, function in class Cookbook
Cookbook.create_cookbooks(chosen_recipes_aoh, this_user_id)

                            # t.integer :user_id
                            # t.string :name
                            # t.integer :website_id
    
        #here, we are taking all of the user recipes and turning them into 
        #hashes in form [{"name"=>"string", "website_id"=>integer}]
        #function is in User class
cookbook_array_of_hashes = user.recipes_into_aoh

selected_recipe = cookbook(cookbook_array_of_hashes)
choice = finalize_cookbook(selected_recipe)
    until choice == true
        selected_recipe = cookbook_redo(cookbook_array_of_hashes)
        choice = finalize_cookbook(selected_recipe)
    end

#selected_recipe is a hash. It could be a hash of an array with one element in it
#could be {"name"=>"string", "website_id"=>integer} or [{"name"=>"string", "website_id"=>integer}]
#come up with logic here to do the search based on the recipe's
#website_id. We can pull up the list of ingredients and the url

#then enter that information into the shopping_list 
shopping_list(recipe_name, recipe_url, recipe_ingredients)





