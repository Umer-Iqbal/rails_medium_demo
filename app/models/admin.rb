class Admin < ApplicationRecord
  has_one_attached :avatar
  has_many :admin_topics_lists
end
