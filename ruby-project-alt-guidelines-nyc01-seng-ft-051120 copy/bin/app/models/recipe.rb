class Recipe < ActiveRecord::Base
    belongs_to :api
    has_many :ingredients
    belongs to :cookbook

    #set the cookbook_id default as nil
        #then, when the user selects the recipe, add the cookbook_id to this recipe's
            #column


    def select_recipe
        #user selects a recipe that goes to the cookbook and we proceed from there
            #add the cookbook_id to this recipe's column


   

    end


end