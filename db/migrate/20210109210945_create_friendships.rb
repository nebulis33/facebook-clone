class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :requestor, null: false, foreign_key: {to_table: :users}
      t.references :requestee, null: false, foreign_key: {to_table: :users}
      t.boolean :status, default: false

      t.timestamps
    end
    add_index :friendships, [:requestor_id, :requestee_id], unique: true
    add_index :friendships, [:requestee_id, :requestor_id], unique: true
  end
end
