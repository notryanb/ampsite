class Ampmodels < ActiveRecord::Migration
  def change
    create_table :ampmodels do |t|
      t.references :manufacturer
      t.string :name

      t.timestamps
    end
  end
end
