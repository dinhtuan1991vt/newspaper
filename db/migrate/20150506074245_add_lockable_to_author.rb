class AddLockableToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :failed_attempts, :integer, default: 0
    add_column :authors, :unlock_token, :string
    add_column :authors, :locked_at, :datetime

    add_index :authors, :unlock_token, unique: true
  end
end
