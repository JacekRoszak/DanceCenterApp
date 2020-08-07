class Option < ApplicationRecord
    has_one :event
    has_many :payments
    has_many :users, through: :payments
end
