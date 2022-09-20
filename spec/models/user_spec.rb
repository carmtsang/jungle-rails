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
      @user2 = User.new(first_name: "Homer ", last_name: "Simpson", email: "homer@simpson.com", password: "abcdef", password_confirmation: "abcdef")

      @user2.save
    
      expect(@user2).to_not be_valid
    end

    it 'should remove the spaces' do
      @user.save
      @user2 = User.new(first_name: "Homer ", last_name: "Simpson", email: "homer@simpson.com", password: "abcdef", password_confirmation: "abcdef")

      @user2.save
    
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
      @user.save
      expect(User.authenticate_with_credentials('homer@simpson.com', '123456')).to eq(@user)
    end

    it 'should be nil if the email is not found' do
      @user.save
      email = 'bart@simpson.com'

      expect(User.authenticate_with_credentials(email, @user.password)).to eq(nil)
    end

    it 'should return nil if the password does not match' do
      @user.save
      password = 'abcdef'
      expect(User.authenticate_with_credentials(@user.email, password)).to eq(nil)
    end

    it 'should return the user if the email is case sensitive' do
      @user.save
      email = 'HOMER@SIMPSON.com'

      expect(User.authenticate_with_credentials(email, @user.password)).to eq(@user)
    end

    it 'should return the user if there is a space before or after the email inputted' do
      @user.save
      expect(User.authenticate_with_credentials("homer@simpson.com ", @user.password)).to eq(@user)
    end
  end

  
end
