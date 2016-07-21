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
    @repos = self.class.get("/#{@username}/repos")
  end

  def get_av_url
    @repos.first["owner"]["avatar_url"]
  end

  def list_repos
    repos = []
    @repos.each do |name|
      repos << name["name"]
    end
    repos
  end
end

erik = RepoClient.new("eadouglas10")
binding.pry
