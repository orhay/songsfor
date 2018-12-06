class CreateSongsForActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :songs_for_activities do |t|
      t.integer :song_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
