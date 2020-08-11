class Event < ApplicationRecord
  has_many :options
  has_many :contracts
  has_many :instructors, through: :contracts, source: :user
  has_many :payments, through: :options
  has_many :participants, through: :payments, source: :user

  belongs_to :user
end
