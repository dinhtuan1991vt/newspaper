class RemoveAvatarAttachment < ActiveRecord::Migration
  def change
    remove_attachment :articles, :avatar
  end
end
