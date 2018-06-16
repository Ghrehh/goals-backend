class AddIndexToUserNameAndRememberDigest < ActiveRecord::Migration[5.1]
  def change
    add_index(:users, :name)
    add_index(:users, :remember_digest)
  end
end
