class Event < ApplicationRecord
    has_many :options
    has_many :contracts
    has_many :users, through: :contracts
    has_many :payments, through: :options
    has_many :users, through: :payments
end
