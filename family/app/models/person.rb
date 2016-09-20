class Person < ActiveRecord::Base
  has_one :address,              dependent: :destroy

  validates :first_name,         presence: true
  validates :last_name,          presence: true
  validates :phone,              presence: true
  validates :age,                presence: true, numericality: { greater_than: 0 }
  validates :email,              confirmation: true
  validates :email_confirmation, presence: true

  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      on: :create

  accepts_nested_attributes_for :address
  validates_associated :address
end