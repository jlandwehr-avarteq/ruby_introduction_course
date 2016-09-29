class Friendship < ActiveRecord::Base
  belongs_to :person
  # tells rails that Friend is a person model since we dont have a friend model
  belongs_to :friend, class_name: 'Person'

  # After creating a Friendship, I want to create the inverse unless the
  # inverse already exists
  after_create :create_inverse, unless: :inverse_exists?

  # After destroying a Friendship, I want to destroy the inverses, if inverses exists
  after_destroy :destroy_inverse, if: :inverse_exists?

  private

  # Create the inverse Friendship
  def create_inverse
     Friendship.create(inverse_friendship)
  end

  # This function should tell me if the inverse Friendship already exists
  # And return a boolean matching the answer
  def inverse_exists?
    Friendship.exists?(inverse_friendship)
  end

  # destroy the inverse Friendship
  def destroy_inverse
    inverses = Friendship.where(inverse_friendship)

    inverses.destroy_all
  end

  # Returns the hash of the inverse Friendship
  def inverse_friendship
    {
      person_id: self.friend_id,
      friend_id: self.person_id
    }
  end
end
