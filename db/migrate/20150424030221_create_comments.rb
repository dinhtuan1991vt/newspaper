class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
    end
  end
end
