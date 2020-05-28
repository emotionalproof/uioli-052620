class Cookbook < ActiveRecord::Base
    has_many :recipes
    has_many :ingredients, through: :recipes
    belongs_to :user
    has_one :pantry_item, through: :user

    #takes in the chosen aoh from our search and our user's ID, creates Cookbooks
    def self.create_cookbooks(chosen_recipes_aoh, userid)
        chosen_recipes_aoh.map do |recipe_hash|
            Cookbook.create(user_id: userid, name: recipe_hash["name"], website_id: recipe_hash["website_id"])
            end
    end

    # def all_ingredients
    #     self.recipes.map do |recipe|
    #         recipe.ingredients
    #     end.uniq.sort
    # end

    # def add_cookbook_shopping_list(pantry_id)
    #     sl = ShoppingList.find_by(pantry_id: pantry_id)
    #     sl.update(cookbook_id = self.id)
    # end

    



    # removal_array = items_string.split(", ")
    # ingred = array.join(", ")



end


