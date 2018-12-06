class CreatePlaylistsForActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists_for_activities do |t|
      t.integer :activity_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
