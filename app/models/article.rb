class Article < ApplicationRecord
  has_rich_text :body
  has_one_attached :thumbnail
  has_many :topics
  has_many :comments
  belongs_to :user
  validates :title, :body, :thumbnail, presence: true
end
