class AddNameAndOmniauthToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
