class Review < ApplicationRecord
  belongs_to :restaurant

  validates :restaurant, presence: true
  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: (1..5)}
end
