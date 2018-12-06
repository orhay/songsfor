class AddPlaylistsForActivityCountToPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :playlists_for_activities_count, :integer
  end
end
