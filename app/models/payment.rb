class Payment < ApplicationRecord
    has_one :user
    has_one :event
    has_one :option
end
