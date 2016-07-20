require 'httparty'
require 'pry'

class RepoClient
  include HTTParty
  base_uri 'api.github.com/users'

  def initialize(user)
    @username = user
  end

  #http://api.wunderground.com/api/6fb454176eef8ba8/geolookup/q/20854.json
  def get_repos
    self.class.get("/#{@username}/repos")
  end

  def list_repos
    repos = []
    get_repos.each do |name|
      repos << name["name"]
    end
    repos
  end
end

#erik = RepoClient.new("eadouglas10")
#binding.pry
