class RemoveDispleyNameFromComment < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :displey_name, :string
  end
end
