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

def cookbook_redo(cookbook_array)
    prompt = TTY::Prompt.new
    cookbook_string = cookbook_array.sort.join(", ")
    prompt.multi_select("\n\nAlright, let's try this again. Here are your cookbook recipes:"\
    "\n\n#{cookbook_string}.\n"\
        "\nYour recipes are listed in alphabetical order."\
        "\nLet's decide what we're cooking today so we can make a shopping list:\n\n") do |menu|
        cookbook_array.sort.map do |array_element|
            menu.choice array_element
            end
        end
end


def finalize_cookbook(selected_recipes)
    prompt = TTY::Prompt.new
    string_recipes = selected_recipes.join(", ")
    continue = prompt.yes?("\nGreat, you picked:\n\n#{string_recipes}.\n\nIf you would like to"\
    " move onto your Shopping List, enter: Y.\n\nIf you would like"\
    " to re-select your recipes, enter: n")
end

#the items they pick will be deleted from the list
def shopping_list(selected_ingredients)
    prompt = TTY::Prompt.new
    selected_ingredients = selected_ingredients.sort
    items_to_delete = prompt.multi_select("\n\nGreat, we have your shopping list below in"\
    " alphebetical order.\n\nYour recipe may ask for greater quantities of ingredients than you have, so\n"\
    "we are including all ingredients on this list - including potential Use It Or Lose Its!"\
    "\n\nIf you are all set with any of the ingredients on this list,"\
    "\nyou can remove them by selecting them below:") do |menu|
        selected_ingredients.map do |ingredients_array_element|
            menu.choice ingredients_array_element
        end
    end
    items_to_delete.each do |item|
        selected_ingredients.delete(item)
    end
    selected_ingredients 
end


# def finalize_shopping_list(selected_ingredients)
#     prompt = TTY::Prompt.new
#     string_recipes = selected_recipes.join(", ")
#     continue = prompt.yes?("\nGreat, you picked:\n\n#{string_recipes}.\n\nIf you would like to"\
#     " move onto your Shopping List, enter: Y.\n\nIf you would like"\
#     " to re-select your recipes, enter: n")
# end
 


