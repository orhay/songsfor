class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.text :description
      t.integer :user_id
      t.string :playlist_name
      t.string :spotify_playlist_id

      t.timestamps
    end
  end
end
