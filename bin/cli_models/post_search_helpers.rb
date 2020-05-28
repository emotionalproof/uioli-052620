require "tty-prompt"



def select_recipes(results_aoh)
    prompt = TTY::Prompt.new
    prompt.multi_select("\nWe have the results of your Use It Or Lose It Search!"\
    "\n\nWhich of these recipes would you like to"\
        " add to your cookbook?\n\n") do |menu|
            results_aoh.each do |array_element|
                menu.choice array_element[:name]
            end
        end
end

#selected_recipes is an array of hashes
def finalize_recipes(selected_recipes_aoh)
    prompt = TTY::Prompt.new
    array_recipe_names = selected_recipes_aoh.map do |recipe_hash|
                            recipe_hash["name"]
                            end
    string_recipes = array_recipe_names.join(", ")
    continue = prompt.yes?("\n\nGreat, you picked:\n#{string_recipes}.\n\nIf you would like to"\
    " add the recipe(s) to your cookbook, enter: Y.\n\nIf you would like"\
    " to re-select your recipes, enter: n")
end

def cookbook(cookbook_array_of_hashes)
    prompt = TTY::Prompt.new
    prompt.select("\n\nGreat, you now have some recipes, but, if you've been with us before,"\
    "\nyou may want to pivot and select something else from your cookbook."\
        "\n\nLet's decide the one meal we are cooking today so we can make a shopping list:\n\n") do |menu|
        cookbook_array_of_hashes.each do |array_element|
            menu.choice array_element["name"]
            end
        end
end

def cookbook_redo(cookbook_array_of_hashes)
    prompt = TTY::Prompt.new
    prompt.select("\n\nAlright, let's try this again.\n"\
        "\nLet's decide which recipe you are cooking today so we can make a shopping list:\n\n") do |menu|
            cookbook_array_of_hashes.each do |array_element|
                menu.choice array_element["name"]
            end
        end
end

def finalize_cookbook(selected_recipe_hash)
    prompt = TTY::Prompt.new
    string_recipe = selected_recipe_hash["name"]
    continue = prompt.yes?("\n\nGreat, you picked:\n#{string_recipe}.\n\nIf you would like to"\
    " move onto your Shopping List, enter: Y.\nIf you would like"\
    " to re-select your recipe, enter: n")
end


def shopping_list(selected_recipe_hash, selected_ingredients_hash)
    recipe_name = selected_recipe_hash["name"]
    recipe_url = selected_recipe_hash["url"]
    #how do I list out the returned ingredients
    puts "Great, you are about to cook #{recipe_name}!"\
    "\n\nYou can find your recipe at #{recipe_url}"\
    "\n\nYour recipe may have greater quantities of ingredients than you have, so\n"\
    " we are including all ingredients on this list - including potential Use It Or Lose Its!"\
    "\n\nHere is your shopping list:"\
    "\n\n#{shopping_list}"\
    "\n\nThank you!\n\nUntil the next time you fear that you will Lose It...\n\n"\
    "We appreciate you for choosing to Use It.\n\n"\
end


# def cookbook(cookbook_array_of_hashes)
#     prompt = TTY::Prompt.new
#     prompt.select("\n\nGreat, you now have some recipes, but, if you've been with us before,"\
#     "\nyou may want to pivot and select something else from your cookbook."\
#         "\n\nLet's decide the one meal we are cooking today so we can make a shopping list:\n\n") do |menu|
#         cookbook_array_of_hashes.each do |array_element|
#             menu.choice array_element["name"]
#             end
#         end
# end

# def cookbook_redo(cookbook_array_of_hashes)
#     prompt = TTY::Prompt.new
#     prompt.select("\n\nAlright, let's try this again.\n"\
#         "\nLet's decide which recipe you are cooking today so we can make a shopping list:\n\n") do |menu|
#             cookbook_array_of_hashes.each do |array_element|
#                 menu.choice array_element["name"]
#             end
#         end
# end

# def finalize_cookbook(selected_recipe_hash)
#     prompt = TTY::Prompt.new
#     string_recipe = selected_recipe_hash["name"]
#     continue = prompt.yes?("\n\nGreat, you picked:\n#{string_recipe}.\n\nIf you would like to"\
#     " move onto your Shopping List, enter: Y.\nIf you would like"\
#     " to re-select your recipe, enter: n")
# end


