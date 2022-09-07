class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :password, presence: true,
end
