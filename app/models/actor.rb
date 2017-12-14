class Actor < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :birth_date, presence: true
  validate :validate_birth_date

  def validate_birth_date
    if birth_date.present? && birth_date >= Date.today
      errors.add(:birth_date, 'Insert a year before this year.')
    end
  end

  has_many :actor_role
end
