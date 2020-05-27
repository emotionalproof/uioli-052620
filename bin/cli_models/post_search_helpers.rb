require "tty-prompt"



def select_recipes(results_array)
    prompt = TTY::Prompt.new
    string_results = results_array.join(", ")
    prompt.multi_select("\nHere are the results of your Use It Or Lose It Search:"\
    "#{string_results}.\n\nWhich of these recipes would you like to"\
        " add to your cookbook?\n\n") do |menu|
        results_array.map do |array_element|
            menu.choice array_element
            end
        end
end

def finalize_recipes(selected_recipes)
    prompt = TTY::Prompt.new
    string_recipes = selected_recipes.join(", ")
    continue = prompt.yes?("\nGreat, you picked:\n #{string_recipes}.\n\n If you would like to"\
    " add the recipe(s) to your cookbook, enter: Y.\n\nIf you would like"\
    " to re-select your recipes, enter: n")
end


def shopping_list(ingredients_array)
    prompt.multi_select("\nHere are the results of your Use It Or Lose It Search:"\
    "#{string_results}.\n\nWhich of these recipes would you like to"\
        " add to your cookbook?\n\n") do |menu|
        results_array.map do |array_element|
            menu.choice array_element
            end
        end
end
 


