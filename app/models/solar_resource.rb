class SolarResource
  def self.gimme
    # establish connection
    connection = Hurley::Client.new "https://developer.nrel.gov"

    # set parameters
      # json / xml
      data_format = "json"

      # use figaro
      api_key = "my little secret"

      # uses Google's geocoding service
      address = "Pittsburgh, PA"

    # write request
    request = "/api/solar/solar_resource/v1.#{data_format}?&api_key=#{api_key}&address=#{address}"

    # send request / get response
    response = connection.get(request)

    # parse response
    data = parse(response.body)
    # get_solar_data(data)
  end

  private
    def self.parse(body)
      JSON.parse(body, symbolize_names: true)
    end

    def self.get_solar_data(data)
      solar_data = {}

      # Average Direct Normal Irradiance
      solar_data[:avg_annual_dni] = data[:outputs][:avg_dni][:annual]
      solar_data[:avg_monthly_dni] = data[:outputs][:avg_dni][:monthly]

      # Average Global Horizontal Irradiance
      solar_data[:avg_annual_ghi] = data[:outputs][:avg_ghi][:annual]
      solar_data[:avg_monthly_ghi] = data[:outputs][:avg_ghi][:monthly]

      # Average Tilt at Latitude
      solar_data[:avg_annual_lat_tilt] = data[:outputs][:avg_lat_tilt][:annual]
      solar_data[:avg_monthly_lat_tilt] = data[:outputs][:avg_lat_tilt][:monthly]

      solar_data
    end
end
