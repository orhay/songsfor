class PlaylistsSong < ApplicationRecord
  # Direct associations

  belongs_to :song,
             :required => false,
             :counter_cache => true

  belongs_to :playlist,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

end
