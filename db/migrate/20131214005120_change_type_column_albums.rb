class ChangeTypeColumnAlbums < ActiveRecord::Migration
  def change
    rename_column :albums, :type, :recording
  end
end
