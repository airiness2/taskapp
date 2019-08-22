class Task < ApplicationRecord
  belongs_to :user

  include AASM

  aasm :column => 'status' do
    state :waiting, :initial => true
    state :doing, :done

    event :run do
      transitions :from => :waiting, :to => :doing
    end

    event :finish do
      transitions :from => :doing, :to => :done
    end
  end

  validates :name, presence: true
  validates :detail, presence: true

  enum priority: ['低', '中', '高']

  has_many :labelings, dependent: :destroy, foreign_key: 'task_id'
  has_many :labels, through: :labelings, source: :label
  accepts_nested_attributes_for :labelings

  has_many :reads, dependent: :destroy

  has_many_attached :files
end
