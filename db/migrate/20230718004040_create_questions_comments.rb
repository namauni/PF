class CreateQuestionsComments < ActiveRecord::Migration[6.1]
  def change
    create_table :questions_comments do |t|
    t.string :user_id
    t.string :question_id
    t.text :comment

      t.timestamps
    end
  end
end
