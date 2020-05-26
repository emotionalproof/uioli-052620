class Ingredient < ActiveRecord::Base
    belongs_to :recipe
    has_one :cookbook, through: :recipe
    

end


#columns: name, recipe_id


