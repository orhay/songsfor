require 'rails_helper'

RSpec.describe Song, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:playlists_songs) }

    it { should have_many(:songs_for_activities) }

    it { should have_many(:recommends) }

    end

    describe "InDirect Associations" do

    it { should have_many(:playlists) }

    it { should have_many(:activities) }

    end

    describe "Validations" do
      
    end
end
