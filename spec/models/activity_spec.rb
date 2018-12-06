require 'rails_helper'

RSpec.describe Activity, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:playlists_for_activities) }

    it { should have_many(:songs_for_activities) }

    it { should have_many(:recommends) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
