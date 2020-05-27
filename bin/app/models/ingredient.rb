class Ingredient < ActiveRecord::Base
    belongs_to :recipe
    # belongs_to :api
    
end


#columns: name, recipe_id


