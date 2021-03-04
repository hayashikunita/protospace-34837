class Prototype < ApplicationRecord
  belongs_to :user
  belongs_to :application
  has_one_attached :image

  validates :image, presence: true

end
