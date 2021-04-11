class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tickets
  has_many :raffles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
