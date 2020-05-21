require 'rails_helper'

RSpec.describe UserServices do
    before(:all) do 
        @u1 = build(:user)
    end

    describe 'Serializer' do
        it '.user_json(user) returns properly serialized user' do
            result = {firstName: @u1.first_name, lastName: @u1.last_name, username: @u1.username}
            expect(UserServices::Serializer::user_json(@u1)).to eq(result)
        end
    end
end 