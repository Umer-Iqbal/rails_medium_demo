class Article < ApplicationRecord
  has_one_attached :images
  belongs_to :user
  has_many :comments
  has_many :admin_topics_lists

  validates :title, presence: true
  validates :body, presence: true

end
