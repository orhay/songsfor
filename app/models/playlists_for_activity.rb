class PlaylistsForActivity < ApplicationRecord
  # Direct associations

  belongs_to :activity,
             :required => false,
             :counter_cache => true

  belongs_to :playlist,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
