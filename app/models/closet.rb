class Closet < ApplicationRecord
    belongs_to :user
    has_many :clothing_items

end
