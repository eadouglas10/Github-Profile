require "./dependencies"

class RepoApp < Sinatra::Base

  get "/" do
    user = params["username"]
    repo_list = []
    ERB.new(File.read("./repo_page.html.erb")).result(binding)
  end


  get "/some.css" do
    File.read("./repocss.css")
  end

  get "/other.css" do
    File.read("./repo_list.css")
  end

  post "/get_repository" do
    user = params["username"]

    repo_list = RepoClient.new(user).list_repos

    ERB.new(File.read("./repo_list_page.html.erb")).result(binding)
  end


  run! if app_file == $PROGRAM_NAME
end




#<p>The weather in <%= zip_code %> is <%= weather %></p>
#<p>The name of the first repo is <%= repo_list[0] %></p>
