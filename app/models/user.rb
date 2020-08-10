class User < ApplicationRecord

  has_secure_password # includes some password validation

  # When creating a User, the 'name' field must be present, i.e. not blank
  validates :name, length: { minimum: 2 }

  validates :email, presence: true, uniqueness: true
end
