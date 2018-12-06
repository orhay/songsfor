class AddSongsForActivityCountToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :songs_for_activities_count, :integer
  end
end
