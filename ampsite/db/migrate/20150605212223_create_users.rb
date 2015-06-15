class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :username, null: false, unique: true
      t.string :password_digest, null: false
      t.string :avatar_url
      t.string :location
      t.boolean :show_email, default: false
      t.string :signature

      t.timestamps null:false
    end
  end
end
