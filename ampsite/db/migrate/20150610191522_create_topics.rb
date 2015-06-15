class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title, null: false, unique: true
      t.string :description, null: false

      t.timestamps
    end
  end
end
