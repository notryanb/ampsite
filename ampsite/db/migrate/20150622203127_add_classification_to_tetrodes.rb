class AddClassificationToTetrodes < ActiveRecord::Migration
  def change
    add_column :tetrodes, :classification, :string
  end
end
