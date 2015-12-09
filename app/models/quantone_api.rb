# A class that handles pulling data from the Quantone API
class QuantoneApi < ActiveModel::Model
  @base_uri = "https://data.quantonemusic.com/v3/"
  @app_id = ENV["QUANTONE_APP_ID"]
  @app_key = ENV["QUANTONE_APP_KEY"]

  def get_artist_data
    options = { query: { "AppID": @app_id, "AppKey": @app_key } }
    response = HTTParty.get(@base_uri, options)
  end

end