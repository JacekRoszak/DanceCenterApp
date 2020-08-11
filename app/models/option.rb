class Option < ApplicationRecord
  belongs_to :event
  has_many :payments
  has_many :users, through: :payments
end
