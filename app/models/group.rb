class Group < ApplicationRecord
  has_many :groupings, dependent: :destroy, foreign_key: 'group_id'
end
