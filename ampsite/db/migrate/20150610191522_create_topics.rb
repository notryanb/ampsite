class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title, null: false, unique: true

      t.timestamps
    end
  end
end
