class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :content, null: false
      t.datetime :dead, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
