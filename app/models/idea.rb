class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :idea_images
  has_many :images, through: :idea_images
end