require "./dependencies"

class RepoApp < Sinatra::Base

  get "/" do
    user = params["username"]
    ERB.new(File.read("./repo_page.html.erb")).result(binding)
  end


  get "/some.css" do
    File.read("./repocss.css")
  end

  post "/get_weather" do
    zip_code = params["zip"]

    weather = WeatherClient.new(zip_code).return_current_weather

    ERB.new(File.read("./repo_page.html.erb")).result(binding)
  end


  run! if app_file == $PROGRAM_NAME
end
