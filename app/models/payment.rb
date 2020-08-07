class Payment < ApplicationRecord
    has_one :user
    has_one :option
    has_one :event, through: :option
end
