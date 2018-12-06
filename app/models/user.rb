class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :recommends

  has_many   :playlists,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
