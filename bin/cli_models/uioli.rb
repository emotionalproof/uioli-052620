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


# username = user_name
old_pantry_string = "peanuts, butter, almonds, crackers, cashews, steak, chicken, broccoli"
whatup = returning_user_pantry(old_pantry_string)

puts whatup

# t = true
# x = true
# # if User.find_by(username: username) == true
# if t == true
#     go_on = user_continue(username)
#     until go_on == true
#         username = user_name
#         # if User.find_by(username: username) == true
#         if x == true
#             go_on = user_continue(username)
#         else
#             go_on = create_username(username)
#         end
#     end
# else
#     go_on = create_username(username)
#     until go_on == true
#         username = user_name
#         #if User.find_by(username: username) == true
#         if x == true
#             go_on = user_continue(username)
#         else
#             go_on = create_username(username)
#         end
#     end
# end

# this_user = User.find_by(username: username)
# this_user_id = this_user.id

# if PantryItem.find_by(user_id: this_user_id)
#     this_pantry = PantryItem.find_by(user_id: this_user_id)
#     pantry_string = this_pantry.ingredients
#     pantry_choices = returning_user_pantry(pantry_string)
# else     
#     pantry_choices = enter_new_pantry
# end

# choice = check_pantry(pantry_choices)

#     until choice == "Continue"
#         if choice == "Remove from Pantry"
#             pantry_choices = remove_from_pantry(pantry_choices)
#             choice = check_pantry(pantry_choices)
#         elsif choice == "Add to Pantry"
#             pantry_choices = add_to_pantry(pantry_choices)
#             choice = check_pantry(pantry_choices)
#         elsif choice == "Redo Pantry"    
#             pantry_choices = enter_new_pantry
#             choice = check_pantry(pantry_choices)
#         elsif choice == "Quit"
#             quit_uioli
#         end
#     end


#     uioli_array = select_uioli(pantry_choices)
#     decision = finalize_uioli(uioli_array)
#         until decision == "Continue. I need to Use this before I Lose It."
#             if decision == "Redo Selection"
#                 uioli_array = select_uioli(pantry_choices)
#                 decision = finalize_uioli(uioli_array)
#             elsif decision == "Quit"
#                 quit_uioli
#             else 
#                 uioli_array
#             end
#         end

#     pantry = Pantry.find    



# results_array = ["bean salad", "jumbalaya", "onions"]
# # if results_array == []

# # else

#     chosen_recipes = select_recipes(results_array)
#     continue = finalize_recipes(chosen_recipes)
#         until continue == true
#             chosen_recipes = select_recipes(results_array)
#             continue = finalize_recipes(chosen_recipes)
#         end

# # end

# all_cookbook_array = ["pizza", "omelette", "avocado"] + chosen_recipes
# #going to have to add the entire cookbook here and add these results to the search
# #will wind up converting a string to an array to add them.
# selected_recipes = cookbook(all_cookbook_array)
# choice = finalize_cookbook(selected_recipes)
#     until choice == true
#         selected_recipes = cookbook_redo(all_cookbook_array)
#         choice = finalize_cookbook(selected_recipes)
#     end


# shopping_list_ingredients = ["onion", "kale", "lettuce", "cheese", "tomato", "jalapeno", "spaghetti", "peanuts", "rice", "chicken", "yams"]

# list_with_removed_items = shopping_list(shopping_list_ingredients)
# final_choice = finalize_shopping_list(list_with_removed_items, selected_recipes)
#     until final_choice == true
#         list_with_removed_items = shopping_list_redo(shopping_list_ingredients)
#         final_choice = finalize_shopping_list(list_with_removed_items, selected_recipes)
#     end

# goodbye





