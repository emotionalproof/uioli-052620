class ShoppingList < ActiveRecord::Base
    belongs_to :cookbook
    # has_many :ingredients, through: :cookbook, through: :recipes
    belongs_to :pantryitem
    has_many :recipes, through: :cookbook

    def create_list
        # Take recipe1.ingredients and place into an array
        # take the items from the Pantry.uioli
        # Take recipe2.ingredients and place into an array. 
        #subtract ingredients from use_it_or_lose_it
        # subtracts those items from Recipe.all.map do |recipes|
        #             recipes.ingredients

        
    end

    def
        #returns the list of current shopping llist and the current pantry
    #Command CLI. Your current shopping list has [] and your current pantry 
    #has _? We do not see any matches.
    #Or We currently see a match of _. Would you like to remove _ from your
    #shopping list? Y/N
    end

    #looks at matches between pantry and current shopping list
    #
    def looks_at_matches

    end

    #initiated with a recipe that you are cooking.
    #can initiate with multiple recipes
    #recipe1, recipe2, recipe3
    #initiate with cookbook_id, initiate with pantry_id

end