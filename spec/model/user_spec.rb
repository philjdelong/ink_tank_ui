require 'rails_helper'


RSpec.describe User, type: :model do
  describe 'validations' do
    it { should belong_to(:shop) }
  end
end
