require "./dependencies"

class MyFavoriteWeatherAppEver < Sinatra::Base

  get "/" do
    zip_code = params["zip"]

    ERB.new(File.read("./views/homepage.html.erb")).result(binding)
  end


  get "/cool.css" do
    File.read("./assets/css/styles.css")
  end

  post "/get_weather" do
    zip_code = params["zip"]

    weather = WeatherClient.new(zip_code).return_current_weather

    ERB.new(File.read("./views/homepage.html.erb")).result(binding)
  end


  run! if app_file == $PROGRAM_NAME
end
