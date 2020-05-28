class Recipe < ActiveRecord::Base
    belongs_to :cookbook
    has_many :ingredients
  
    #takes in array of names and returns an array of its recipe ids
    def self.create_and_return_id(array_of_names)
        recipe_array_ids = [] 
            array_of_names.each do |recipe_name|
            rec = Recipe.create(name: recipe_name)
            recipe_array_ids << rec.id
            end
            recipe_array_ids
       end

    #takes in an array of recipe id's, a cookbook row, and updates the recipe's cookbook_id
    #to belong to the cookbook
    def self.attach_recipe_to_cookbook(recipe_id_array, cookbook_row)
        recipe_id_array.each do |recipe_id|
            rec = Recipe.find_by(id: recipe_id)
            rec.update(cookbook_id: cookbook_row.id)
        end
    end

    #takes in an array of recipe names, returns their 
    selected_recipes.map do |recipe|
        recipe.ingredients.map do |ingredient|
            ingredient
        end
    end

    #set the cookbook_id default as nil
        #then, when the user selects the recipe, add the cookbook_id to this recipe's
            #column This operation will be done in the cookbook.


end