class WeatherController < ApplicationController
  def index

  @city = params[:city] || "Chicago"
  @state = params[:state] || "IL"

  @weather = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22wallawalla%2C%20wa%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body

  @state = @weather['query']['results']['channel']['location']['region']
  @city = @weather['query']['results']['channel']['location']['city']
  @temperature = @weather['query']['results']['channel']['item']['condition']['temp']

  @forecast = @weather['query']['results']['channel']['item']['forecast']

  end

end
