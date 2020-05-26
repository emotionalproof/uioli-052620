class UseItOrLoseIt < ActiveRecord::Base
    belongs_to :pantry
    has_many :initial_ingredients, through: :pantry

end

#columns: name, foreign key for pantry
