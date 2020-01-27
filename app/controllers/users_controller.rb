class UsersController < ApplicationController

    def login
        byebug
    end 

    private

    def login_params 
        params.require(:user).permit(:username, :password)
    end 
end
