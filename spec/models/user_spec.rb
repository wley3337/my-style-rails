require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do 
    @u1 = create(:user)
  end

  after(:all) do 
    User.destroy_all
  end

  describe 'validations' do 
    describe 'does not allow duplicate usernames' do
      it 'is valid for unique names' do 
        valid_username = build(:user, username: "Jr")
        expect(valid_username.valid?).to be(true)
      end
      it 'is invalid for duplicates case insensitve' do 
        duplicate_username = build(:user, username: "bob123") 
        expect(duplicate_username.valid?).to be(false)
      end
    end
  end 
end
