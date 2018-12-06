class Song < ApplicationRecord
  # Direct associations

  has_many   :playlists_songs

  has_many   :songs_for_activities

  has_many   :recommends

  # Indirect associations

  has_many   :playlists,
             :through => :playlists_songs,
             :source => :playlist

  has_many   :activities,
             :through => :songs_for_activities,
             :source => :activity

  # Validations

end
