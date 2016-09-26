class DeleteObtainedAtFromDegree < ActiveRecord::Migration
  def change
    remove_column :degrees, :obtained_at
  end
end
