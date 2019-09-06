class Group < ApplicationRecord
  has_many :groupings, dependent: :destroy
  has_many :group_users, through: :groupings, source: :user
end
