class User < ApplicationRecord
    has_secure_password
    has_many :outfits 
    has_many :closets
end
