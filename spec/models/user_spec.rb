require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:recommends) }

    it { should have_many(:playlists) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
