class User < ApplicationRecord
  has_one_attached :avatar
  has_many :articles
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :username, :description, :avatar, :password, :password_confirmation, presence: true
end
