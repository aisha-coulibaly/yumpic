class Post < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  acts_as_taggable_on :skills, :interests
  #validates :rate, numericality: {
  #  less_than_or_equal_to: 5,
  #  greater_than_or_equal_to: 1
 # }, presence: true
end
