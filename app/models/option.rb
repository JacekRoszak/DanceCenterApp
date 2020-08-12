class Option < ApplicationRecord
  belongs_to :event
  has_many :payments
  has_many :users, through: :payments

  validates :number, presence: true
  validates :amount, presence: true
  validates :event_id, presence: true
  validates :name, presence: true

  validates :name, length: {minimum:3, maximum:40}


end