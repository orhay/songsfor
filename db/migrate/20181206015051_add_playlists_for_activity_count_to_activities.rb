class AddPlaylistsForActivityCountToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :playlists_for_activities_count, :integer
  end
end
