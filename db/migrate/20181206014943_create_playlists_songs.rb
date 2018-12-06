class CreatePlaylistsSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists_songs do |t|
      t.integer :song_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
