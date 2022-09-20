class User < ApplicationRecord
  before_save {self.email = email.downcase.strip}

  has_secure_password
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :first_name, :last_name, :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }


  def self.authenticate_with_credentials(email, password)
    user_email = email.downcase.strip
    @user = User.find_by(email: user_email)
      if @user && @user.authenticate(password)
        @user
    elsif
      nil
    end
  end

end
