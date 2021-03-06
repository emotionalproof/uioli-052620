require "tty-prompt"


def user_name
    prompt = TTY::Prompt.new 
    prompt.ask("\n\n\nNote: Capitalization and symbols matter when selecting and searching"\
    " for a username.\n\n         What is your username?")
end


def user_continue(entered_username)
    prompt = TTY::Prompt.new 
    prompt.yes?("\n\n\n\n\n\nWelcome, #{entered_username}. \n\nWe see that you have used Use It Or Lose It"\
    " before. \n\nIf you would like to continue as #{entered_username} enter: Y. \n\nIf you are not"\
    " #{entered_username} or would like to continue as a different username, enter: n")
end

def create_username(entered_username)
    prompt = TTY::Prompt.new 
    prompt.yes?("\n\n\n\n\n\n\n\nWelcome, #{entered_username}. \n\nWe see that you are new to"\
    " Use It Or Lose It. \n\nIf you would like to continue as the new user, #{entered_username},"\
    " enter: Y. \n\nIf you would like to try again to see if you have an account already,\nor if you would"\
    " like to continue as different username, enter: n")
end


def enter_new_pantry
    prompt = TTY::Prompt.new 
pantry_string= prompt.ask("\n\n\n\n\n\n\n\n\n\n\nLet's get started! Please enter items from your current pantry.\n\n"\
    "If you have multiple ingredients, please separate them with a comma and a space.\n"\
    "Example: garlic, tomato, onion, spinach\n"\
    "\nEnter items here:") do |q|
        q.convert -> (input) { input.downcase.split(/,\s*/).uniq.sort }
      end

      if pantry_string == nil
        pantry_string = enter_new_pantry
      end
      pantry_string
     
end


def returning_user_pantry(old_pantry_string)
    prompt = TTY::Prompt.new
    old_pantry_array = old_pantry_string.split(", ")
    new_pantry = prompt.ask("\n\n\n\n\n\n\n\n\n\nWelcome back! Here's what we had in your pantry the last time you were here:"\
    "\n\n#{old_pantry_string}\n\n"\
    "Don't worry about clearing your pantry or deleting items you no longer have, we'll get to that next."\
    "\nFor now, you can add any items you would like to add to your pantry.\n\n"\
    "If you have multiple ingredients, please separate them with a comma and a space.\n"\
    "Example: garlic, tomato, onion, spinach\n"\
    "\n\nEnter items here:") do |q|
        q.convert -> (input) { input.downcase.split(/,\s*/).uniq.sort }
    end

      if new_pantry == nil
        old_pantry_array.uniq.sort
        # new_pantry = returning_user_pantry(old_pantry_string)
      else
        (old_pantry_array + new_pantry).uniq.sort
      end   
 end
 


def check_pantry(pantry_selections)
    prompt = TTY::Prompt.new 
    pantry_string = pantry_selections.join(", ")
    prompt.select("\n\n\n\n\n\n\n\n\nHere is what we have in your pantry:"\
    "\n#{pantry_string}\n\nPlease note that we have sorted your pantry alphabetically,"\
    " written all items in lower case letters,\nand eliminated any duplicate items to help us with our search."\
    "\n\nChoose 'Continue' if you would like to select your Use It Or Lose It items."\
    "\nChoose 'Redo Pantry' if you would like to start over with an empty pantry."\
    "\nChoose 'Remove from Pantry' if you would like to remove pantry items."\
    "\nChoose 'Add to Pantry' if you would like to add pantry items."\
    "\nChoose 'Quit' if you have to leave.") do |menu|
        menu.choice 'Continue'
        menu.choice 'Redo Pantry'
        menu.choice 'Remove from Pantry'
        menu.choice 'Add to Pantry'
        menu.choice 'Quit'
        end
end

def add_to_pantry(pantry_selection)
    prompt = TTY::Prompt.new 
    pantry_to_string = pantry_selection.join(", ")
    new_items = prompt.ask("\n\n\n\n\n\n\n\n\nHere is your current pantry:"\
    "\n#{pantry_to_string}"\
    "\n\nPlease add items to your current pantry.\n\n"\
    "If you have multiple ingredients, please separate them with a comma and a space.\n"\
    "Example: garlic, tomato, onion, spinach\n"\
    "\nEnter items here:") do |q|
        q.convert -> (input) { input.downcase.split(/,\s*/).uniq }
      end
    (pantry_selection + new_items).uniq.sort
end

def remove_from_pantry(pantry_array)
    prompt = TTY::Prompt.new 
    items_to_delete =  prompt.multi_select("\n\n\n\n\n\n\n\n\nPlease select which of your"\
        " pantry items you wish to delete.") do |menu|
            pantry_array.map do |pantry_array_element|
                menu.choice pantry_array_element
            end
        end
    items_to_delete.each do |item|
        pantry_array.delete(item)
    end
    pantry_array
end

def quit_uioli
    puts "\n\n\n\n\n\n\n\nWe are sorry to Lose you without Using your items. Have a good day!\n\n"
    exit
end
        
def select_uioli(pantry_array)
    prompt = TTY::Prompt.new 
    prompt.multi_select("\n\n\n\n\n\n\n\n\n\nLet's figure out which of your"\
        " pantry items you must Use Or Lose.\nRemember, your pantry is sorted"\
        " alphabetically so keep scrolling down if you do not see your item.\n") do |menu|
        pantry_array.map do |pantry_array_element|
            menu.choice pantry_array_element
            end
        end
end

def finalize_uioli(selected_uioli)
    prompt = TTY::Prompt.new
    string_uioli = selected_uioli.join(", ")
    prompt.select("\n\n\n\n\n\n\n\n\n\nGreat, you picked: #{string_uioli}."\
        "\n\nChoose 'Continue' if you would like to start your Use It Or Lose It Search."\
        "\nChoose 'Redo Selection' if you would like re-select your Use It Or Lose It items."\
        "\nChoose 'Quit' if you have to leave.\n") do |menu|
            menu.choice 'Continue. I need to Use It before I Lose It.'
            menu.choice 'Redo Selection'
            menu.choice 'Quit'
        end
end

