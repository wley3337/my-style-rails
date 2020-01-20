class Category < ApplicationRecord
    has_many :clothing_categories
    has_many :clothing_items, through: :clothing_categories
end
