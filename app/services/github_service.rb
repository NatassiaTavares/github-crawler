require 'rest-client'

class GithubService
    def initialize
        @url = 'api.github.com'
    end

    def get_repositories
        complete_url = "#{@url}/repositories" 
        RestClient.get()
    end
end