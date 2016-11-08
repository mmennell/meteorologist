require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

    ds_tkn = "903267d10c37b900ca94c79b88ee2b3e"
    api_url = "https://api.forecast.io/forecast/" + ds_tkn + "/" + @lat.to_s + "," + @lng.to_s

    require 'open-uri'
    parsed_data = JSON.parse(open(api_url).read)


    @current_temperature =  parsed_data["currently"]["temperature"]

    @current_summary = parsed_data["currently"]["summary"]

    @summary_of_next_sixty_minutes = parsed_data["minutely"]["summary"]

    @summary_of_next_several_hours = parsed_data["hourly"]["summary"]

    @summary_of_next_several_days = parsed_data["daily"]["summary"]

    render("forecast/coords_to_weather.html.erb")
  end
end
