class Payment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :option

  delegate :event, to: :option

  validates :amount, presence: true
  validates :option_id, presence: true
end
