class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :user_id
      t.string :content_id
      t.string :question_id
      t.string :tag
      

      t.timestamps
    end
  end
end
