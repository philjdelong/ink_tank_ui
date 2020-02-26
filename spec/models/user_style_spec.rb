require 'rails_helper'

describe UserStyle, type: :model do
  describe 'relationships'  do
    it { should belong_to(:style) }
    it { should belong_to(:user) }
  end
end
