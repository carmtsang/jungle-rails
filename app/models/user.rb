class User < ApplicationRecord
  has_secure_password
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :first_name, :last_name, :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }


  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email)
      if @user && @user.authenticate(password)
        @user
    elsif
      puts "cant log in"
      nil
    end
  end

end
