class Label < ApplicationRecord
  has_many :labelings, dependent: :destroy, foreign_key: 'label_id'
  has_many :tasks, through: :labelings, source: :label
  accepts_nested_attributes_for :labelings
end
