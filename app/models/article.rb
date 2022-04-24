class Article < ApplicationRecord
  has_rich_text :body
  has_one_attached :thumbnail, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, :body, :thumbnail, presence: true
end
