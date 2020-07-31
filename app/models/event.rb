class Event < ApplicationRecord
    has_many :options
    has_many :payments
end
