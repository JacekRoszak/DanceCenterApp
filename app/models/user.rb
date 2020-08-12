class User < ApplicationRecord
  has_many :contracts     # dla instruktorów
  has_many :payments      # dla uczestników
  has_many :events        # dla organizatorów
  has_many :posts

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  # https://github.com/heartcombo/devise/wiki/How-To:-Add-:confirmable-to-Users

  def paid_events         # dla relacji między uczestnikiem a eventem
    Event                   # Eventy
      .joins(:options)        # dla których opcje
      .where(options: { id:     # a dokładnie id tych opcji
        payments.pluck(:option_id).uniq }) # znajdują się w zbiorze id opcji opłaconych
      .distinct
  end

  def paid_future_events
    paid_events.where('events.start_date > ?', Time.now)
  end
end
