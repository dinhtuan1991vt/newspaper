class AddRoleToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :role, :string
  end
end
