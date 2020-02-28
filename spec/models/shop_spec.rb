require 'rails_helper'

RSpec.describe Shop, type: :model do
  it { should have_many(:artists) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:street_address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:zip) }
end
