class User < ApplicationRecord
  has_many :tasks

  before_validation { email.downcase! }

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                  uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password, length: {minimum: 6}, on: :update, allow_blank: true

  has_secure_password

end
