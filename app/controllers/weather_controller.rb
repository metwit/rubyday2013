class WeatherController < UIViewController
  def loadView
    self.view = WeatherView.new
  end

  def viewDidLoad
    get_weather
  end

  def get_weather
    BW::Location.get_once do |result|
      AFMotion::JSON.get("https://api.metwit.com/v2/weather/?location_lat=#{result.latitude}&location_lng=#{result.longitude}") do |response|
        update_icon(response.object['objects'].first['icon'])
      end
    end
  end

  def update_icon(url)
    self.view.weather_icon.url = url
  end
end
