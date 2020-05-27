require 'pry'
require "tty-prompt"
require './pre_search_helpers.rb'
require './post_search_helpers.rb'
require './app/models/user.rb'
require './app/models/pantry_item.rb'
require './app/models/use_it_or_lose_it.rb'
require './app/models/search.rb'
require './app/models/api.rb'
require './app/models/recipe.rb'
require './app/models/ingredient.rb'
require './app/models/cookbook.rb'
require './app/models/shopping_list.rb'





    





username = user_name

t = false
x = false
#if User.find_by(username: username) == true
if t == true
    go_on = user_continue(username)
    until go_on == true
        username = user_name
        #if User.find_by(username: username) == true
        if x == true
            go_on = user_continue(username)
        else
            go_on = create_username(username)
        end
    end
else
    go_on = create_username(username)
    until go_on == true
        username = user_name
        #if User.find_by(username: username) == true
        if x == true
            go_on = user_continue(username)
        else
            go_on = create_username(username)
        end
    end
end


pantry_choices = enter_new_pantry
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





