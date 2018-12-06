class Song < ApplicationRecord
  # Direct associations

  has_many   :recommends

  # Indirect associations

  # Validations

end
