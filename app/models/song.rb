class Song < ApplicationRecord
  # Direct associations

  has_many   :playlists_songs

  has_many   :songs_for_activities

  has_many   :recommends

  # Indirect associations

  # Validations

end
