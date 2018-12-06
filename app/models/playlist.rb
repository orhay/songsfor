class Playlist < ApplicationRecord
  # Direct associations

  has_many   :playlists_songs

  has_many   :playlists_for_activities

  belongs_to :user,
             :required => false,
             :counter_cache => true

  # Indirect associations

  has_many   :songs,
             :through => :playlists_songs,
             :source => :song

  has_many   :activities,
             :through => :playlists_for_activities,
             :source => :activity

  # Validations

end
