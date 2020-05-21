class User < ApplicationRecord
    has_secure_password
    has_many :outfits 
    has_many :closets
    validates :username, uniqueness: {case_sensitive: false}
end
