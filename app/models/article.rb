class Article < ApplicationRecord
  has_rich_text :body
  has_one_attached :thumbnail
  belongs_to :user
  has_many :comments
  has_many :admin_topics_lists

  validates :title, presence: true
  validates :body, presence: true
  validates :thumbnail, presence: true

end
