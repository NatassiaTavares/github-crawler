require 'rest-client'

class GithubService
    def initialize
        @url = 'api.github.com'
        @languages = ['java', 'elixir', 'python', 'ruby', 'scala']
    end

    def search_repositories_from_languages
        complete_url = "#{@url}/search/repositories?q=language:python&sorts:stars"
        response = RestClient.get(complete_url)
        response_hash = JSON.parse(response)
        parse_response_to_repositories(response_hash)
    end

    private

    def build_search_query
        #TODO: this
    end

    def parse_response_to_repositories(response)
        items = response['items']

        items.each do |item|
            next if Repository.find_by(github_id: item['id']) 

            repo = Repository.new
            repo.github_id = item['id']
            repo.name = item['name']
            repo.full_name = item['full_name']
            repo.private = item['private']
            owner = Owner.new
            owner_hash = item['owner']
            owner.github_id = owner_hash['id']
            owner.url = owner_hash['url']
            owner.html_url = owner_hash['html_url']
            repo.html_url = item['html_url']
            repo.description = item['description']
            repo.fork = item['fork']
            repo.open_issues = item['open_issues']
            repo.watchers = item['watchers']
            repo.score = item['score']
            repo.save 
        end
    end
end