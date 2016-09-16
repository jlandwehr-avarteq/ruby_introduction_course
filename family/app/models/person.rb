class Person < ActiveRecord::Base
  has_one :address, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :age, presence: true, :numericality => { :greater_than => 0 }
  validates :email, confirmation: true
  validates :email_confirmation, presence: true 
end
