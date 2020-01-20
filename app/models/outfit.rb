class Outfit < ApplicationRecord
    belongs_to :user
    has_many :worns
    has_many :clothing_outfits
    has_many :clothing_itmes, through: :clothing_outfits
end
