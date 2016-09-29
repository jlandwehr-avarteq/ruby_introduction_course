class AddObtainedAtToPeopleDegrees < ActiveRecord::Migration
  def change
    add_column :people_degrees, :obtained_at, :datetime
  end
end
