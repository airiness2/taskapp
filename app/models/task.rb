class Task < ApplicationRecord
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
end
