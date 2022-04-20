class Article < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments

  validates :title, :body, presence: true
end
