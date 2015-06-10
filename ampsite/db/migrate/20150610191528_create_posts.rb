class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :topic, null: false
      t.references :author, null: false
      t.string :title, null: false, unique: true
      t.string :content, null: false

      t.timestamps
    end
  end
end
