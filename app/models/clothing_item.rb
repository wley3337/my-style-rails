class ClothingItem < ApplicationRecord
    has_many :clothing_outfits
    has_many :outfits, through: :clothing_outfits
    belongs_to :closet
    has_many :clothing_categories 
    has_many :categories, through: :clothing_categories

end
