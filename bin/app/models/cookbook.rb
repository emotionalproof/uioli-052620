class Cookbook < ActiveRecord::Base
    has_many :recipes
    has_many :ingredients, through: :recipes
    belongs_to :user
    has_one :pantry_item, through: :user

    def recipes
        self.recipes
    end

    def all_ingredients
        self.recipes.map do |recipe|
            recipe.ingredients
        end.uniq.sort
    end

    def add_cookbook_shopping_list(pantry_id)
        sl = ShoppingList.find_by(pantry_id: pantry_id)
        sl.update(cookbook_id = self.id)
    end

    



    # removal_array = items_string.split(", ")
    # ingred = array.join(", ")



end


