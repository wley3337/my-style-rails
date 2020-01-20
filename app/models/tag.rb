class Tag < ApplicationRecord
    has_many :clothing_tags
    has_many :clothing_items, through: :clothing_tags
end
