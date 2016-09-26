class DeleteObtainedAtFromPoepleDegrees < ActiveRecord::Migration
  def change
    remove_column :people_degrees, :obtained_at
  end
end
