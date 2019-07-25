require 'rest-client'

class GithubService
	def initialize
		@url = 'api.github.com'
		@languages = ['java', 'elixir', 'python', 'ruby', 'scala']
	end

	def search_repositories_from_languages
		@languages.each do |language|
			complete_url = "#{@url}/search/repositories?q=language:#{language}&sorts:stars"
			response = RestClient.get(complete_url)
			response_hash = JSON.parse(response)

			save_data_from_response(response_hash)
		end
	end

	private
	def save_data_from_response(response)
		items = response['items']

		items.each do |item|
			save_repository_from_response(item)     
		end
	end

	def save_repository_from_response(repository_hash) 
		return if Repository.exists?(github_id: repository_hash['id']) 

		repo = Repository.new
		repo.github_id = repository_hash['id']
		repo.name = repository_hash['name']
		repo.full_name = repository_hash['full_name']
		repo.private = repository_hash['private']
		repo.html_url = repository_hash['html_url']
		repo.description = repository_hash['description']
		repo.fork = repository_hash['fork']
		repo.open_issues = repository_hash['open_issues']
		repo.watchers = repository_hash['watchers']
		repo.score = repository_hash['score']
		repo.language = repository_hash['language']

		#TODO: this is bad code
		owner = create_owner_from_response(repository_hash['owner'])
		owner.save
		
		repo.owner = owner
		repo.save
	end

	def create_owner_from_response(owner_hash) 
		owner = Owner.find_by(external_id: owner_hash['id'])
		return owner unless owner.blank?
		
		owner = Owner.new
		owner.external_id = owner_hash['id']
		owner.url = owner_hash['url']
		owner.html_url = owner_hash['html_url']
		owner.login = owner_hash['login']    

		owner
  end
end