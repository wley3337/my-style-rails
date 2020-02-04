require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
    before(:all) do
        @u1 = create(:user)
    end

    after(:all) do
        User.destroy_all
    end

    describe 'login' do
        it 'returns serialzied user with correct password' do

            post(:login, params: {user: {username: "Bob123", password: "123"}} )
            expect(response.code).to eq("200")
        end

        describe 'returns success: false and code status 409' do
            it'for bad password' do
                post(:login, params: {user: {username: "Bob123", password: "bad password"}}) 
                expect(response.code).to eq("409")
                expect(response.body.include?("false")).to be(true)
            end

            it'for bad username' do
                post(:login, params: {user: {username: "", password: "123"}}) 
                expect(response.code).to eq("409")
                expect(response.body.include?("false")).to be(true)
            end
        end
    end

    describe 'create' do 
        it 'returns serialized user with unique username' do 
            post(:create, params: {user: {firstName: "Bob", lastName: "Patt", password: "123", username: "Jr"}})
            expect(response.code).to eq("201")
            expect(response.body.include?("Bob")).to be(true)
        end

        describe 'invalid username' do 
            it 'returns success: false and status code 406' do 
                post(:create, params: {user: {firstName: "Bob", lastName: "Patt", password: "123", username: @u1.username}})
                expect(response.code).to eq("406")
                expect(response.body.include?("false")).to be(true)
            end
            it 'returns errors: full_error messages' do 
                post(:create, params: {user: {firstName: "Bob", lastName: "Patt", password: "123", username: @u1.username}})
                expect(response.body.include?("Username has already been taken")).to be(true)
            end
        end
    end 

    describe "auto_login" do 
        it "returns a user on successful token auth" do
            allow_any_instance_of(ApplicationController).to receive(:authenticate).and_return(@u1)
            allow_any_instance_of(ApplicationController).to receive(:generate_token).and_return("fake token")
            allow_any_instance_of(Api::V1::UsersController).to receive(:current_user).and_return(@u1)

            allow(UserServices::Serializer).to receive(:user_json).and_return(@u1)

            get(:auto_login)
            expect(response.code).to eq("200")
            expect(response.body.include?("true")).to be(true)
        end 

        it "returns unauthorized for bad/no token" do 
            get(:auto_login)
            expect(response.code).to eq("401")
        end
    end 

end
