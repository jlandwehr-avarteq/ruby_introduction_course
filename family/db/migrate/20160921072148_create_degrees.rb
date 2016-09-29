class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :title
      t.datetime :obtained_at

      t.timestamps null: false
    end
  end
end
