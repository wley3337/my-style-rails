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

    def create
        user = User.new(create_params_json)
        if user.save
            render json: { success: true, user: Serializer::user_json(user), token: "fake_token" }, status: 201
        else 
            render json: { success: false, errors: user.errors.full_messages}, status: 409
        end
    end

    private

    def login_params 
        params.require(:user).permit(:username, :password)
    end 

    def create_params_json
        params_hash = params.require(:user).permit(:firstName, :lastName, :username, :password)
        {first_name: params_hash["firstName"], last_name: params_hash["lastName"], username: params_hash["username"], password:params_hash["password"] }
    end
end
