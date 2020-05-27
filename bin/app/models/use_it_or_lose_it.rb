class UseItOrLoseIt < ActiveRecord::Base
    belongs_to :pantryitem

    # def uoili_ingredients_to_array
    #     self.ingredients.split(", ")
    # end


end

#columns: name, foreign key for pantry
