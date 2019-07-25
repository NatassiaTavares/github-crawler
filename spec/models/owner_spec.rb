require 'rails_helper'

RSpec.describe Owner, type: :model do
  include FactoryBot::Syntax::Methods

  before :each do
    @owner = Owner.any? ? Owner.first : create(:owner)
  end

  describe 'validates uniqueness of external_id' do
    it 'is not valid' do
      owner = @owner.dup
      expect(owner).to_not be_valid
    end
  end
end
