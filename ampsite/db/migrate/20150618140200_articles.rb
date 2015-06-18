class Articles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.references :user, null: false
      t.string :title
      t.string :body, null: false

      t.timestamps
   end
  end
end
