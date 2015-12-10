# A class that handles pulling data from the Quantone API
class QuantoneApi
  include ActiveModel::Model

  @base_uri = "https://data.quantonemusic.com/v3/"
  @app_id = ENV["QUANTONE_APP_ID"]
  @app_key = ENV["QUANTONE_APP_KEY"]

  def self.get_artist_data
    url = @base_uri + "Artists"
    query = {}
    headers = {}
    headers["AppID"] = @app_id
    headers["AppKey"] = @app_key

    # 1950.upto(2000) do |year|
    dates = 2001.upto(2001)
    dates.each do |year|
      puts "DOING YEAR: #{year}"
      query["dateBorn"] = year

      response = HTTParty.get(url, query: query, headers: headers)
      body = response.body
      results = eval(body) # convert the response to hash format
      artists = results[:Results] # get a list of returned artists

      artists.each do |artist|
        # add artist data to database
        quantoneID = artist[:Id]
        stageName = artist[:StageName]
        artistType = artist[:ArtistType]
        gender = artist[:Gender]
        imageID = artist[:ImageId]
        legalName = artist[:LegalName]
        birthYear = year
        deathYear = artist[:DeathDate].to_i
        birthPlace = artist[:BirthPlace]
        deathPlace = artist[:DeathPlace]
        age = 2015 - birthYear.to_i

        artist_hash = { age: age, quantoneID: quantoneID, stageName: stageName, artistType: artistType, gender: gender, imageID: imageID, legalName: legalName, birthYear: birthYear, deathYear: deathYear, birthPlace: birthPlace, deathPlace: deathPlace }
        artist_object = QuantoneArtist.create(artist_hash)
        artist_object.save
      end

      puts "Sleeping..."
      sleep(15)
    end
  end

end