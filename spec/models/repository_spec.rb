require 'rails_helper'

RSpec.describe Repository, type: :model do
  include FactoryBot::Syntax::Methods

  context 'when not valid' do
    describe 'when already has same github_id' do
      before (:each) do
        @repository = Repository.any? ||= create(:repository)
      end
    
      it 'should not be valid' do
        repository_dupe = @repository.dup
        expect(repository_dupe).to_not be_valid
      end
    end
  end
end
