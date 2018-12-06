class AddPlaylistsSongCountToPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :playlists_songs_count, :integer
  end
end
