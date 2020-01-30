require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do 
    @u1 = create(:user)
  end

  after(:all) do 
    User.destroy_all
  end

  describe 'validations' do 
    it 'does not allow duplicate usernames' do
      duplicate_username = build(:user) 
      valid_username = build(:user, username: "Jr")
      expect(duplicate_username.valid?).to be(false)
      expect(valid_username.valid?).to be(true)
    end
  end 
end
