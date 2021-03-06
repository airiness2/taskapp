class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :labels, dependent: :destroy

  has_many :groupings, dependent: :destroy
  has_many :user_groups, through: :groupings, source: :group

  has_many :reads, dependent: :destroy

  before_validation { email.downcase! }

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password, length: { minimum: 6 }, on: :update, allow_blank: true

  has_secure_password

  mount_uploader :image, ImageUploader

  before_destroy :dont_delete_admin

  private

  def dont_delete_admin
    if admin? && User.where(admin: true).count == 1
      throw :abort
    end
  end
end
