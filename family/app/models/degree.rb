class Degree < ActiveRecord::Base
  has_many :people_degrees ,                  dependent: :destroy
  has_many :people, through: :people_degrees
  has_many :school_degrees,                   dependent: :destroy
  has_many :schools, through: :school_degrees

  validates :title, presence: true
end
