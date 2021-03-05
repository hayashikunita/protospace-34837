class Prototype < ApplicationRecord

  has_many :commnets,   dependent: :destroy
  belongs_to :user
  has_one_attached :image

  validates :image,         presence: true
  validates :title,         presence: true
  validates  :catch_copy,   presence: true
  validates  :concept,      presence: true
end
