class SolarResource
  def self.data(address)
    connection = Hurley::Client.new "https://developer.nrel.gov"
    data_format = "json"
    api_key = ENV['nrel_api_key']

    request = "/api/solar/solar_resource/v1.#{data_format}?&api_key=#{api_key}&address=#{address}"

    response = connection.get(request)

    data = parse(response.body)
    format_data(data[:outputs])
  end

  private

    def self.parse(body)
      JSON.parse(body, symbolize_names: true)
    end

    def self.format_data(data)
      solar_data = data.reduce({}) do |solar_data, (var, value)|
        solar_data[variables_map.fetch(var)] = {
          "Annual" => value[:annual],
          "Monthly" => format_months(value[:monthly])
        }
        solar_data
      end
      solar_data
    end

    def self.format_months(data)
      data.map { |month, value| [month.to_s.capitalize, value] }.to_h
    end

    def self.variables_map
      {
        avg_dni: "Average Direct Normal Irradiance",
        avg_ghi: "Average Global Horizontal Irradiance",
        avg_lat_tilt: "Average Tilt at Latitute"
      }
    end
end
