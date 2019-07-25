require 'rails_helper'

RSpec.describe GithubService do
	before :each do
		@service = GithubService.new
	end

	describe 'search_repositories_from_languages' do
		it 'should return a repository list' do
			VCR.use_cassette("repositories/search_from_language") do
				repositories = @service.search_repositories_from_languages
				expect(repositories).not_to be_empty
			end
		end
	end
end
