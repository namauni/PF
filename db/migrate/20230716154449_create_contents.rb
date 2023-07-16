class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :text
      t.number :total_like
      t.string :user_id

      t.timestamps
    end
  end
end
