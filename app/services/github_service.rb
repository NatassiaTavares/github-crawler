require 'rest-client'

class GithubService
    def initialize
        @url = 'api.github.com'
        @languages = ['java', 'elixir', 'python', 'ruby', 'scala']
    end

    def search_repositories_from_languages
        @languages.each do |language|
            complete_url = "#{@url}/search/repositories?q=language:#{@language}&sorts:stars"
            response = RestClient.get(complete_url)
            response_hash = JSON.parse(response)
            save_repositories_from_response(response_hash)
        end
    end

    private
    def save_repositories_from_response(response)
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
            repo.language = item['language']
            repo.save 
        end
    end
end