require "tty-prompt"


# results_array = ["onion soup", "roasted peppers", "challah bread", "kingsbury pie", "rootenbery"]
# def select_recipes(results_array)
#     prompt = TTY::Prompt.new
#     string_results = results_array.join(", ")
    
#     prompt.multi_select("\nHere are the results of your Use It Or Lose It Search:" 
#     "#{string_results}.\n\nWhich of these recipes would you like to"\
#         " add to your cookbook?"\n\n) do |menu|
#         results_array.map do |array_element|
#             menu.choice array_element
#             end
#         end
# end

# def finalize_recipes(selected_recipes)
#     prompt = TTY::Prompt.new
#     string_recipes = selected_recipes.join(", ")
#     continue = prompt.yes?("\nGreat, you picked:\n #{string_recipes}.\n\n If you would like to"\
#     " add #{string_recipes} to your cookbook, enter: Y.\n\nIf you would like"\
#     " to re-select your recipes, enter: n")
# end

 


# pantry_array = ["garlic", "onions", "peppers", "tomatoes"]
# chosen_uioli = select_uioli(pantry_array)
# continue = finalize_uioli(chosen_uioli)
 
# until continue == true
#     selectuioli = select_uioli(pantry_array)
#     continue = finalize_uioli(selectuioli)
# end

# results_array = ["pizza", "omelette", "avocado"]
# if results_array == []

# else
    # chosen_recipes = select_recipes(results_array)
    # continue = finalize_recipes(chosen_recipes)
    #     until continue == true
    #         choose_recipes = select_recipes(results_array)
    #         continue = finalize_recipes(choose_recipes)
    #     end

# end


end