class PantryItem < ActiveRecord::Base
    belongs_to :user
    has_one :useitorloseit
    has_one :shopping_list


    def items_array
        self.ingredients.split(", ")
    end

    # def add_pantry_items(string_ingredients)
    #     array = self.items_array
    #     new_items = string_ingredients.split(', ')
    #     new_array = array + new_items
    #     new_array.uniq
    # end

    # def remove_pantry_items(items_string)
    #     array = self.items_array
    #     removal_array = items_string.split(", ")
    #     index = 0
    #     while index < removal_array.length do
    #         array.delete(removal_array[index])
    #         index += 1
    #     end
    #     ingred = array.join(", ")
    #     self.update(ingredients: ingred)
    # end

   

    # def uioli(selection_array)
    #     array = self.items_array
    #     index = 0
    #     while index < selection_array.length do
    #         array.delete(selection_array[index])
    #         index += 1
    #     end
    #     ingred = array.join(", ")
    #     selection_string = selection_array.join(", ")
    #     self.update(ingredients: ingred)
    #     self.update(uioli: selection_string)
    # end

    def make_shopping_list
        ShoppingList.find_or_create_by(pantryitem_id: self.id)
    end
    
end

