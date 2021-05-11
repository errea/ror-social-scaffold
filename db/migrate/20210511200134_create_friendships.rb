class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :user, index: true, null: false, foreign_key: true
      t.references :friend, index: true null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
