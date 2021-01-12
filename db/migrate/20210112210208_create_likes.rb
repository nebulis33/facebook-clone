class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true
      t.references :likeable, polymorphic: true

      t.timestamps
    end
    add_index :likes, [:user_id, :likeable_type, :likeable_id], unique: true
  end
end
