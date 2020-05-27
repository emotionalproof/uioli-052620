class User < ActiveRecord::Base
    has_one :pantryitem
    has_one :useitorloseit, through: :pantryitem
    has_one :cookbook




end

#columns: name