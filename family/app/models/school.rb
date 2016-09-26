class School < ActiveRecord::Base
  has_one  :address, as: :owner,  dependent: :destroy
  has_many :school_degrees,       dependent: :destroy
  has_many :degrees, through: :school_degrees
  has_many :people, through: :degrees

  validates :school_name, presence: true

  accepts_nested_attributes_for :address
  validates_associated          :address
end
