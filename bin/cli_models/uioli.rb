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
        until decision == "Continue. I need to Use this before I Lose It."
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


# results_array = ["bean salad", "jumbalaya", "onions"]
# if results_array == []

# else

    chosen_recipes = select_recipes(results_array)
    continue = finalize_recipes(chosen_recipes)
        until continue == true
            chosen_recipes = select_recipes(results_array)
            continue = finalize_recipes(chosen_recipes)
        end
#chosen recipes needs to be the name of the recipe.
 #take in recipe names and creates recipes, while returning an array of their ids
    recipe_id_array = Recipe.create_and_return_id(chosen_recipes)
    
if Cookbook.find_by(user_id: this_user_id)
    this_cookbook = Cookbook.find_by(user_id: this_user_id)
    Recipe.attach_recipe_to_cookbook(recipe_id_array, this_cookbook)
    all_cookbook_array = this_cookbook.recipes
else
    this_cookbook = Cookbook.create(user_id: this_user_id)
    Recipe.attach_recipe_to_cookbook(recipe_id_array, this_cookbook)
    all_cookbook_array = this_cookbook.recipes
end

#all_cookbook_array includes the recipe rows, not the recipe names,
#will have to filter that down to the names in the cookbook function
selected_recipes = cookbook(all_cookbook_array)
choice = finalize_cookbook(selected_recipes)
    until choice == true
        selected_recipes = cookbook_redo(all_cookbook_array)
        choice = finalize_cookbook(selected_recipes)
    end

            # this is wrong
    # shopping_list_ingredients = selected_recipes.map do |recipe|
    #                                 recipe.ingredients.map do |ingredient|
    #                                     ingredient
    #                                 end
    #                             end

list_with_removed_items = shopping_list(shopping_list_ingredients)
final_choice = finalize_shopping_list(list_with_removed_items, selected_recipes)
    until final_choice == true
        list_with_removed_items = shopping_list_redo(shopping_list_ingredients)
        final_choice = finalize_shopping_list(list_with_removed_items, selected_recipes)
    end

goodbye





