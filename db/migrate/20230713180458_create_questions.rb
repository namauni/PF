class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.string :user_id
      t.boolean :answered

      t.timestamps
    end
  end
end
