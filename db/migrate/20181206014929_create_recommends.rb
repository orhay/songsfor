class CreateRecommends < ActiveRecord::Migration[5.1]
  def change
    create_table :recommends do |t|
      t.integer :song_id
      t.integer :user_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
