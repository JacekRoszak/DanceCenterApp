class Contract < ApplicationRecord
    has_one :event
    has_one :user
end
