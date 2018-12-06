class AddSongsForActivityCountToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :songs_for_activities_count, :integer
  end
end
