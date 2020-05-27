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
    prompt = TTY::Prompt.new
    prompt.multi_select("\nHere are the results of your Use It Or Lose It Search:"\
    "#{string_results}.\n\nWhich of these recipes would you like to"\
        " add to your cookbook?\n\n") do |menu|
        results_array.map do |array_element|
            menu.choice array_element
            end
        end
end

def cookbook(cookbook_array)
    prompt = TTY::Prompt.new
    cookbook_string = cookbook_array.sort.join(", ")
    prompt.multi_select("\n\nGreat, you now have some recipes, but, if you've been with us before,"\
    "\nyou may want to pivot and select something else from your cookbook:"\
    "\n\n#{cookbook_string}.\n\n"\
        "You may have also selected more recipes than you intend to cook!"\
        "\nYour recipes are listed in alphabetical order."\
        "\n\nLet's decide what we're cooking today so we can make a shopping list:\n\n") do |menu|
        cookbook_array.sort.map do |array_element|
            menu.choice array_element
            end
        end
end
 


