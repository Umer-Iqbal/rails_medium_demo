class User < ApplicationRecord
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :username, presence: true
  validates :description, presence: true
  validates :avatar, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
