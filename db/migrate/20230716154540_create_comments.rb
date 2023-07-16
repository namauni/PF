class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :user_id
      t.string :content_id
      t.string :question_id
      t.string :displey_name
      t.text :comment

      t.timestamps
    end
  end
end
