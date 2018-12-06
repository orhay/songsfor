require 'rails_helper'

RSpec.describe Playlist, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:playlists_songs) }

    it { should have_many(:playlists_for_activities) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
