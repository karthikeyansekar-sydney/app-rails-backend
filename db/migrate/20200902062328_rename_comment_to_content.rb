class RenameCommentToContent < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :comment, :content
  end
end
