class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, null: false
      t.belongs_to :commentable, polymorphic: true
      t.string :content, null: false

      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
