class Task < ActiveRecord::Base
  enum status: [ :uncomplete, :complete ]
end
