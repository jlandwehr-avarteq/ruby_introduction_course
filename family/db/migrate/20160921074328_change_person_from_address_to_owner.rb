class ChangePersonFromAddressToOwner < ActiveRecord::Migration
  def change
    remove_reference :addresses, :person, index: true
    add_reference :addresses, :owner, polymorphic: true, index: true
  end
end
