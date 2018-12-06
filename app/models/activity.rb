class Activity < ApplicationRecord
  # Direct associations

  has_many   :songs_for_activities

  has_many   :recommends

  # Indirect associations

  # Validations

end
