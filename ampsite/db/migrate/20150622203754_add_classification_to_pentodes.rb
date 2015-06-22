class AddClassificationToPentodes < ActiveRecord::Migration
  def change
    add_column :pentodes, :classification, :string
  end
end
