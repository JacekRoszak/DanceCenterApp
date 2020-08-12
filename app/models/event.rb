class Event < ApplicationRecord
  has_many :options
  has_many :contracts
  has_many :instructors, through: :contracts, source: :user
  has_many :payments, through: :options
  has_many :participants, through: :payments, source: :user

  belongs_to :user

  validates :event_name, presence: true
  validates :event_name, uniqueness: true
  validates :event_name, length: {minimum:10}


  validates :start_date, presence: true
end
