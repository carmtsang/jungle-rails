require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new(first_name: "Homer", last_name: "Simpson", email: "homer@simpson.com", password: "123456", password_confirmation: "123456")
    end
    it 'should be valid with matching passwords and password confirmation'
    it 'should be not be valid with mismatching passwords and password confirmation'
    it 'should not be valid without a first name' do
      @user.first_name = nil
      @user.validate

      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'should not be valid without a last name' do
      @user.last_name = nil
      @user.validate

      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'should not be valid without an email'
    it 'should have an email that is unique'
    it 'should not be valid with an email length less than 6'

  end
end
