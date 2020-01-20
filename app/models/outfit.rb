class Outfit < ApplicationRecord
    belongs_to :user
<<<<<<< HEAD
    has_many :worns
    has_many :clothing_outfits
    has_many :clothing_itmes, through: :clothing_outfits
=======

>>>>>>> 1818eae0fe0764c640c252d41d231d4c41519d00
end
