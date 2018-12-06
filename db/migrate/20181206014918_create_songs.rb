class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.text :artist
      t.string :song_name

      t.timestamps
    end
  end
end
