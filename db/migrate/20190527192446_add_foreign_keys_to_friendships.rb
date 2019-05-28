class AddForeignKeysToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :friendships, :people, column: :friend1 , on_delete: :cascade
    add_foreign_key :friendships, :people, column: :friend2 , on_delete: :cascade
  end
end
