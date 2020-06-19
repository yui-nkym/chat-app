class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  validates :text, presence: true, unless: :was_attached?

  def was_attached?
    self.image.present?
  end
end
