require 'rails_helper'

RSpec.describe UsersController, type: :controller do
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

end
