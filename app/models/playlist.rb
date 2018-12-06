class Playlist < ApplicationRecord
  # Direct associations

  has_many   :playlists_for_activities

  belongs_to :user,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
