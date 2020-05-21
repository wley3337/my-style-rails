class ClothingCategory < ApplicationRecord
    belongs_to :clothing_item
    belongs_to :category
end
