module UserServices
    class Serializer
        def self.user_json(user)
            {firstName: user.first_name, lastName: user.last_name, username: user.username}
        end 
    end
end