class RenameCommentsToPostComments < ActiveRecord::Migration
  def change
    rename_table :comments, :post_comments
  end
end
