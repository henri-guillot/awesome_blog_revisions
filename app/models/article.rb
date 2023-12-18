class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
  has_one_attached :photo
end
