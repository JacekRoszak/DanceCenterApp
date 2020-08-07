class User < ApplicationRecord
  has_many :contracts
  has_many :payments
  has_many :events, through: :contracts
  has_many :options, through: :payments
  has_many :events, through: :options
  has_many :posts

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
