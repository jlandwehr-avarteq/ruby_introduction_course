class CreatePeopleDegrees < ActiveRecord::Migration
  def change
    create_table :people_degrees do |t|
      t.references :person, index: true, foreign_key: true
      t.references :degree, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
