class ShoppingList < ActiveRecord::Base
    belongs_to :cookbook
    # has_many :ingredients, through: :cookbook, through: :recipes
    belongs_to :pantryitem
    has_many :recipes, through: :cookbook
    @@list = nil


    def ingredients_array
        self.cookbook.all_ingredients
    end

    def uioli_array
        self.pantryitem.uioli.split(", ")
    end

    def pantry_array
        self.pantryitem.ingredients.split(", ")
    end

    def list
        @@list
    end

    def create_list
        array = self.ingredients_array
        lose_it = self.uioli_array
        index = 0
        while index < lose_it.length do
            array.delete(lose_it[index])
            index += 1
        end
        self.pantryitem.update(uioli: nil)
        @@list = array.join(", ")
    end

    def search_pantry
        pantry = self.pantry_array
        list_array = @@list.split(", ")
        match_array = []
        pantry.each do |ingredients|
            list_array.each do |ingredient|
                if ingredients == ingredient
                    match_array << ingredients
                end
            end
        end
        match_array
    end

    def remove_selected_pantry(pantry_ar)
        array = @@list.split(", ")
        index = 0
        while index < pantry_ar.length do
            array.delete(pantry_ar[index])
            index += 1
        end
        
        pantry_update = self.pantry_array
        count = 0
        while count < pantry_ar.length do
            pantry_update.delete(pantry_ar[count])
            count += 1
        end
        pantry_string = pantry_update.join(", ")
        self.pantryitem.update(ingredients: pantry_string)
        @@list = array.join(", ")
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