class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.integer :friend1
      t.integer :friend2

      t.timestamps
    end
  end
end
