class Pet < ActiveRecord::Base
  belongs_to :person

  ANIMAL_TYPES = [:cat, :dog].freeze

  def self.inheritance_column
    nil
  end

  validates :type,  presence: true
  validates :name,  presence: true
  validates :age,   presence: true, numericality: { greater_that: 0}
end