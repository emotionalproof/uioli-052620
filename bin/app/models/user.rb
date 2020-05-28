class User < ActiveRecord::Base
    has_one :pantryitem
    has_manys :cookbooks

    def recipes_into_aoh
        cookbook_array_of_hashes = []
        self.cookbooks.each do |recipes|
            cookbook_array_of_hashes << {"name"=>recipes.name, "website_id"=>recipes.website_id}
        end
        cookbook_array_of_hashes
    end
end

