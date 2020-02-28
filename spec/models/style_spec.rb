require 'rails_helper'

describe Style, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  describe 'relationships' do
    it { should have_many(:artist_styles) }
    it { should have_many(:artists) }
  end
end
