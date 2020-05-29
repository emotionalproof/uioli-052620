class Search < ActiveRecord::Base
    belongs_to :useitorloseit
    has_one :pantryitem, through: :useitorloseit

    def ingredients_to_array
        self.ingredients.split(", ")
    end

    # def narrow_search
        #search_array = []
        # array = self.ingredients_to_array
        
        # array.each do |ingredient|
        #API.each do |api|
            
        #have to look through each API
        #get to the key for ingredients
        #pull up the values of the ingredients
           #find it any of them == ingredients
             #add that recipe to the search_array
    # end

    #need a default statement if there are no recipes that match the ingredients.
     #"I'm sorry, but out of _ recipes, none matched your ingredients."

end

#columns: foreign id key for use_it_or_lose_it, name:?, 
#takes the ingredients from use_it_or_lose_it, combines with 
#potentially add initial search options like cuisine or meal