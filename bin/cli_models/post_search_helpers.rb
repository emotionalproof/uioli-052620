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
    continue = prompt.yes?("\nGreat, you picked:\n#{string_recipes}.\n\nIf you would like to"\
    " add the recipe(s) to your cookbook, enter: Y.\nIf you would like"\
    " to re-select your recipes, enter: n")
end


def shopping_list(ingredients_array)
    prompt = TTY::Prompt.new
    prompt.multi_select("\nHere are the results of your Use It Or Lose It Search:"\
    "\n\n#{string_results}.\n\nWhich of these recipes would you like to"\
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
        "Also, you may have selected more recipes than you intend to cook!"\
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
    continue = prompt.yes?("\nGreat, you picked:\n#{string_recipes}.\n\nIf you would like to"\
    " move onto your Shopping List, enter: Y.\nIf you would like"\
    " to re-select your recipes, enter: n")
end

#the items they pick will be deleted from the list
def shopping_list(selected_ingredients)
    prompt = TTY::Prompt.new
    selected_ingredients = selected_ingredients.sort
    items_to_delete = prompt.multi_select("\n\nGreat, we have your shopping list below in"\
    " alphabetical order.\n\nYour recipe may ask for greater quantities of ingredients than you have, so\n"\
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


def finalize_shopping_list(selected_ingredients, selected_recipes)
    prompt = TTY::Prompt.new
    string_recipes = selected_recipes.sort.join(", ")
    string_ingredients = selected_ingredients.sort.join(", ")
    continue = prompt.yes?("\n\nGreat, you plan on cooking:\n#{string_recipes}\n\n"\
    "And your shopping list includes:\n#{string_ingredients}.\n\n"\
    "If you are ready to shop, enter: Y.\nIf you would like"\
    " to re-select your shopping list, enter: n")
end
 

def shopping_list_redo(ingredients_array)
    prompt = TTY::Prompt.new
    ingredients_array = ingredients_array.sort
    items_to_delete = prompt.multi_select("\n\nAlright, let's try this again. Your shopping list is below."\
        "\nAll ingredients are listed in alphabetical order."\
        "\n\nYou may remove any items from your shopping list by selecting them now:\n\n") do |menu|
        ingredients_array.sort.map do |array_element|
            menu.choice array_element
            end
        end
        items_to_delete.each do |item|
            ingredients_array.delete(item)
        end
    ingredients_array
end

def goodbye
    puts "\n\nThank you!\n\nUntil the next time you fear that you will Lose It...\n\n"\
    "We appreciate you for choosing to Use It.\n\n"\
end

