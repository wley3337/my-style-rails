class Season < ApplicationRecord
    has_many :outfit_seasons
    has_many :outfits, through: :outfit_seasons
end
