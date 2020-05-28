class Cookbook < ActiveRecord::Base
    belongs_to :user

    #takes in the chosen aoh from our search and our user's ID, creates Cookbooks
    def self.create_cookbooks(chosen_recipes_aoh, userid)
        chosen_recipes_aoh.each do |recipe_hash|
            Cookbook.create(user_id: userid, name: recipe_hash["name"], website_id: recipe_hash["website_id"])
            end
    end

end


