class AddRecommendCountToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :recommends_count, :integer
  end
end
