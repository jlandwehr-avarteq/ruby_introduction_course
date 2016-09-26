class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :person,  index: true, foreign_key: true
      t.references :friend, index: true

      t.timestamps null: false
    end
    add_foreign_key :friendships, :people, column: :friend_id
    add_index :friendships, [:person_id, :friend_id], unique: true
  end
end
