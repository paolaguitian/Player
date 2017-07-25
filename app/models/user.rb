class User < ApplicationRecord
  has_secure_password
has_many :comments
validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
end
