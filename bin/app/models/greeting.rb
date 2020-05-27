class Greeting < ActiveRecord::Base

    # prompt.yes?('Do you like Ruby?')
    # =>
    # Do you like Ruby? (Y/n)

    # def greeting
        #prompts the user for their name to create
#         And then call ask with the question for simple input:

# prompt.ask('What is your name?', default: ENV['USER'])
# # => What is your name? (piotr)

    # end

    # def receive_name(name)
    #     #takes in name 
    #     User.create("name")
    # end



    #Welcome to Use It Or Lose It? Let's get started. 

    #first time no incredient's, if they're returning. 
    # def initiate_pantry
    #     great, name. 
    
    
        
    #     Please enter the ingredients from 
    #      your current pantry. If you have multiple ingredients, please 
    #     use lower case letters and separate them with a comma and a space. 
    #     Example: garlic, tomato, onion, spinach

    #     Great, 

    #You have added _. If anything else, pick Add Ingredient. If you are done,
    # enter: Move On. If you are not satisfied with the spelling of an ingredient, enter:
    #redo. If you have to leave, enter: exit.
#   Jax

#     choices = %w(Scorpion Kano Jax)
# prompt.select("Choose your destiny?", choices, help: "(Bash keyboard)", symbols: {marker: '>'})
# # =>
# Choose your destiny? (Bash keyboard)
# >  Done
#    Add Ingredient
#    Redo
#    Exit

    # end

    # def initiate_uioli
        #Great, you currently have _.
        #Now, let's figure out which of these ingredients you must Use Or Lose. 
#         Also, asking multiple choice questions is a breeze with multi_select:

# choices = %w(vodka beer wine whisky bourbon)
# prompt.multi_select("Select drinks?", choices)
# # =>

# Select drinks? (Use ↑/↓ arrow keys, press Space to select and Enter to finish)"
# ‣ ⬡ vodka
#   ⬡ beer
#   ⬡ wine
#   ⬡ whisky
#   ⬡ bourbon

# #Great, we are ready to search with _. #would you like to proceed or re-select
# #your items
# #prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
# #
# # Select drinks? (Use ↑/↓ arrow keys, press Space to select and Enter to finish)"
# ‣ ⬡ Search. I need to Use It Or Lose It, now!
#   ⬡ Re-select items
#     @ let's go back to our pantry
#    ⬡ Quit




    # def recipe_search
        #Great, you currently have _.
        #Now, let's figure out which of these ingredients you must Use Or Lose. 
#         Also, asking multiple choice questions is a breeze with multi_select:

# choices = %w(vodka beer wine whisky bourbon)
# prompt.multi_select("Select drinks?", choices)
# # =>

# Select drinks? (Use ↑/↓ arrow keys, press Space to select and Enter to finish)"
# ‣ ⬡ recipe1
#   ⬡ recipe2
#   ⬡ recipe3
#   ⬡ whisky
#   ⬡ bourbon
#When they select the recipes that they want going to have to do a
#cb = Cookbook.find_or_create_by(user_id: user_id)
#recipe_name_array.each do |recipe_name|
#   cb.add_recipe(recipe_name)
#end
 
#cb.add_cookbook_shopping_list(p_id)





    #returns the list of current shopping llist and the current pantry
#Command CLI. Your current shopping list has [] and your current pantry 
#has _? We do not see any matches.
#Or We currently see a match of _. Would you like to remove _ from your
#shopping list? Y/N










        #To make sure you don't lose this ingredient forever, you are going to enter
        #one ingredient at time. Please enter the first ingredient in using lower
        #case letters
        #example: swiss cheese

        #You entered _. If anything else, just type in the next ingredient. If nothing else,
    # enter: done. If you are not satisfied with the spelling of an ingredient, enter
    #redo. If you have to leave, enter: exit.

    #I'm sorry, _ did not match any of the ingredients in your pantry. If you would like 
    #to add this to your search anyway, enter yes. If not, enter: no. If you would lik
    #to redo the spelling just type in the ingredient again. If you have to leave, enter: exit.
       
         #You entered _. If anything else, just type in the next ingredient. If nothing else,
    # enter: done. If you are not satisfied with the spelling of an ingredient, enter
    #redo. If you have to leave, enter: exit.
        

#     end

end