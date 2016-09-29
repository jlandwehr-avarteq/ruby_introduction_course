class CreateSchoolsDegrees < ActiveRecord::Migration
  def change
    create_table :school_degrees do |t|
      t.references :school, index: true, foreign_key: true
      t.references :degree, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
