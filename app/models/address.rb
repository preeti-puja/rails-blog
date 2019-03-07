class Address < ApplicationRecord
  validates :street1, :city, :country, :pin_code, presence: true
  validate :validates_city
  belongs_to :user

  def validates_city
    unless ["Kolkata", "Bangaluru", "Delhi", "Pune"].include? city.capitalize
      errors.add(:city, "is invalid")
    end
  end
end
