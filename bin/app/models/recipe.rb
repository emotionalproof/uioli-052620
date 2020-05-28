class Recipe < ActiveRecord::Base
    belongs_to :cookbook
    has_many :ingredients
  

    #set the cookbook_id default as nil
        #then, when the user selects the recipe, add the cookbook_id to this recipe's
            #column This operation will be done in the cookbook.


end