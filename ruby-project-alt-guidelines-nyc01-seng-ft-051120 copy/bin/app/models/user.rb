class User < ActiveRecord::Base
    has_one :pantry
    has_one :use_it_or_lose_it, through: :pantry
    has_one :cookbook

end

#columns: name