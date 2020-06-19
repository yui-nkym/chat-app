class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :text, presence: true
  has_one_attached :image
end
