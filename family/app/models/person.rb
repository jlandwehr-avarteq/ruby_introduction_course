class Person < ActiveRecord::Base
  has_one :address,              as: :owner,    dependent: :destroy

  has_many :pets,                               dependent: :destroy
  has_many :people_degrees,  dependent: :destroy
  has_many :degrees, through: :people_degrees
  has_many :friendships,                        dependent: :destroy
  has_many :friends, through: :friendships

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