class PersonToPeople < ActiveRecord::Migration
  def change
    create_table :person_people do |t|
      t.references :friends

      t.references :timestamp
    end
  end
end
