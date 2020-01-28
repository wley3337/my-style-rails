class Api::V1::UsersController < ApplicationController
    include UserServices
    def login
        user = User.find_by(username: login_params[:username])
        if user && user.authenticate(login_params[:password])
            render json: { success: true, user: Serializer::user_json(user), token: "fake_token" }
        else
            render json: { success: false }, status: 409
        end
    end 

    private

    def login_params 
        params.require(:user).permit(:username, :password)
    end 
end
