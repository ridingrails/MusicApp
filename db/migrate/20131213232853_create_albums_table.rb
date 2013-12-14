class CreateAlbumsTable < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, :null => false
      t.integer :band_id, :null => false
      t.string :type, :null => false

      t.timestamps
    end
  end
end
