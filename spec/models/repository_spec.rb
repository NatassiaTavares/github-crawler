require 'rails_helper'

RSpec.describe Repository, type: :model do
  include FactoryBot::Syntax::Methods

  before :each do
    @repository = create(:repository)
  end

  describe 'validates uniqueness of github_id' do
    # it 'is valid' do
    #   #repository_dupe = new Repository
    #   #repository_dupe.
    #   #expect(repository_dupe).to be_valid  
    # end

    it 'is not valid' do
      repository_dupe = @repository.dup
      expect(repository_dupe).to_not be_valid
    end
  end
end
