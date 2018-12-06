class AddPlaylistsSongCountToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :playlists_songs_count, :integer
  end
end
