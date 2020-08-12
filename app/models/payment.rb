class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :option

  delegate :event, to: :option

  validates :amount, presence: true
  validates :user_id, presence: true
  validates :option_id, presence: true
end
