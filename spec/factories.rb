FactoryBot.define do
    factory :user do 
        first_name { "Bob" }
        last_name { "Patt" }
        username { "Bob123" }
        password { "123" }
    end 

    factory :closet do 
        user 
        name { "Test Closet 1"}
    end 
    #seasons:
    factory :winter, class: Season do 
        name { "winter" }
    end

    factory :summer, class: Season do 
        name { "summer" }
    end

    factory :spring, class: Season do 
        name { "spring" }
    end

    factory :fall, class: Season do 
        name { "fall" }
    end
    #outfits 
    factory :outfit_1, class: Outfit do 
        user 
        casual {true}
        name {"Test Outfit 1"}
        after(:create) do | outfit|
            outfit.seasons << FactoryBot.create(:spring)
            outfit.seasons << FactoryBot.create(:summer)
        end
    end

    factory :outfit_2, class: Outfit do 
        user 
        casual {true}
        name {"Test Outfit 2"}
        after(:create) do | outfit|
            outfit.seasons << FactoryBot.create(:winter)
            outfit.seasons << FactoryBot.create(:spring)
        end
    end

    factory :outfit_3, class: Outfit do 
        user 
        casual {true}
        name {"Test Outfit 3"}
        after(:create) do | outfit|
            outfit.seasons << FactoryBot.create(:winter)
            outfit.seasons << FactoryBot.create(:summer)
        end
    end

    
   


end