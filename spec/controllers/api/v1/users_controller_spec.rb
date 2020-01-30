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
            it 'returns success: false and status code 409' do 
                post(:create, params: {user: {firstName: "Bob", lastName: "Patt", password: "123", username: @u1.username}})
                expect(response.code).to eq("409")
                expect(response.body.include?("false")).to be(true)
            end
            it 'returns errors: full_error messages' do 
                post(:create, params: {user: {firstName: "Bob", lastName: "Patt", password: "123", username: @u1.username}})
                expect(response.body.include?("Username has already been taken")).to be(true)
            end 
        end
    end 

end
