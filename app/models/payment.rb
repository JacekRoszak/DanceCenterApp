class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :option

  delegate :event, to: :option
end
