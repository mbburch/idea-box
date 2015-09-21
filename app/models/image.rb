class Image < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  has_many :idea_images
  has_many :ideas, through: :idea_images
end