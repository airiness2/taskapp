class Group < ApplicationRecord
  has_many :groupings, dependent: :destroy, foreign_key: 'group_id'
  has_many :group_users, through: :groupings, source: :user
end
