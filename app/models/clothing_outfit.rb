class ClothingOutfit < ApplicationRecord
    belongs_to :outfit 
    belongs_to :clothing_item
end
