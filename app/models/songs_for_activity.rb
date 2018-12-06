class SongsForActivity < ApplicationRecord
  # Direct associations

  belongs_to :activity,
             :counter_cache => true

  belongs_to :song,
             :counter_cache => true

  # Indirect associations

  # Validations

end
