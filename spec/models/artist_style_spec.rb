require 'rails_helper'

describe ArtistStyle, type: :model do
  describe 'relationships'  do
    it { should belong_to(:style) }
    it { should belong_to(:artist) }
  end
end
