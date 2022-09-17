require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new(first_name: "Homer", last_name: "Simpson", email: "homer@simpson.com", password: "123456", password_confirmation: "123456")
    end

    it 'should be valid with matching passwords and password confirmation' do
      @user.validate
      expect(@user.password).to eq(@user.password_confirmation)
    end

    it 'should be not be valid with mismatching passwords and password confirmation' do
      @user.password_confirmation = nil
      @user.validate

      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

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

    it 'should not be valid without an email' do
      @user.email = nil
      @user.validate

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should have an email that is unique' do
      @user.save
      @user2 = User.new(first_name: "Homer", last_name: "Simpson", email: "homer@simpson.com", password: "123456", password_confirmation: "123456")
    
      expect(@user2).to_not be_valid
    end

    it 'should not be valid with a password length less than 6' do
      @user.password = '123'
      @user.password_confirmation = '123'

      @user.validate
      
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end  
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(first_name: "Homer", last_name: "Simpson", email: "homer@simpson.com", password: "123456", password_confirmation: "123456")
    end

    it 'should return the user if email and password match' do
    end

    it 'should be nil if the email is not found' do
      email = 'bart@simpson.com'
      # @user.validate

      expect(User.authenticate_with_credentials(email, @user.password)).to eq(nil)
    end
  end
  
end
