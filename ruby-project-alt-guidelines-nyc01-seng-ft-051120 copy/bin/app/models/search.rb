class Search < ActiveRecord::Base
    belongs_to :use_it_or_lose_it
    has_one :pantryitem, through: :use_it_or_lose_it


end

#columns: foreign id key for use_it_or_lose_it, name:?, 
#takes the ingredients from use_it_or_lose_it, combines with 
#potentially add initial search options like cuisine or meal