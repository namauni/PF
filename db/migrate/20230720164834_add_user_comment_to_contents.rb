class AddUserCommentToContents < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :user_comment, :text
  end
end
