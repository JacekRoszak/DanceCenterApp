class Option < ApplicationRecord
    has_one :event
    has_many :payments
end
