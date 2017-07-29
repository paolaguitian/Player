class User < ApplicationRecord
  has_secure_password
has_many :comments, dependent: :destroy
has_many :games, dependent: :destroy
validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
end
