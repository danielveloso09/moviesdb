class Movie < ApplicationRecord
  validates :year, presence: true, numericality: true
  validates :title, presence: true, uniqueness: { scope: :year }

  has_many :reviews

  scope :alphabetically, -> { order(:title) }
  scope :from_year, ->(year) { where(year: year) }

  default_scope -> { alphabetically }
end
