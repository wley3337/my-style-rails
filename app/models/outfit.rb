class Outfit < ApplicationRecord
    belongs_to :user
    has_many :worns
end
