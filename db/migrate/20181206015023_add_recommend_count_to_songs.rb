class AddRecommendCountToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :recommends_count, :integer
  end
end
