class Address < ActiveRecord::Base
  belongs_to :owner, polymorphic: true

  validates :number,   presence: true, numericality: { greater_than: 0 }
  validates :street,   presence: true
  validates :zip_code, presence: true
  validates :city,     presence: true
  validates :country,  presence: true
end
