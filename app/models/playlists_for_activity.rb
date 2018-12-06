class PlaylistsForActivity < ApplicationRecord
  # Direct associations

  belongs_to :playlist,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
