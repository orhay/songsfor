require 'rails_helper'

RSpec.describe PlaylistsForActivity, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:playlist) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
