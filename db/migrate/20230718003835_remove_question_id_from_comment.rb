class RemoveQuestionIdFromComment < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :question_id, :string
  end
end
