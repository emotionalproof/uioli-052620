class User < ActiveRecord::Base
    has_one :pantryitem
    has_manys :cookbooks




end

#columns: name