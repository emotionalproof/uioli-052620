class User < ActiveRecord::Base
    has_one :pantryitem
    has_many :cookbooks

    #takes its recipes and creates an array of hashes: {"name"=>recipes.name, "website_id"=>recipes.website_id}
    def recipes_into_aoh
        cookbook_array_of_hashes = []
        self.cookbooks.each do |recipes|
            cookbook_array_of_hashes << {"name"=>recipes.name.titleize, "website_id"=>recipes.website_id}
        end
        cookbook_array_of_hashes.sort_by {|hash| hash["name"]}
    end
end

# array.sort_by {|hash| hash[:name]}

