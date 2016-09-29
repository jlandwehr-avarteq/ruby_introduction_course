class SchoolDegree < ActiveRecord::Base
  belongs_to :school
  belongs_to :degree
end
