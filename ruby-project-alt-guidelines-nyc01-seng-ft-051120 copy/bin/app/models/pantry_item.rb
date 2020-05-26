class PantryItem < ActiveRecord::Base
    belongs_to :user
    has_one :use_it_or_lose_it

    # def add_items(items)
    #     Ingredient.create()
    # end

    

    def remove_items(items)

    end

    def select_items_for_uioli(items)
     
        #items that belong in the use_it_or_lose_it
        #these selected items will then be removed from the pantry_stock
    end

   
    
    def display_items

    end

    def display_uioli

    end


    def remove_uioli_from_pantry 

    end


    
end


#foreign key of User_id, name_string
