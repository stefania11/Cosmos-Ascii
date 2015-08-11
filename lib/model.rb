require 'json'                                                     # => false
require 'open-uri'                                                 # => true
require 'pry'                                                      # => true
class Apod
  BASE_URL = "https://api.nasa.gov/planetary/apod?api_key="  # => "http://charts.spotify.com/api/tracks/most_streamed"

  def key
    key = File.read('key')
  end

  def url
    BASE_URL + key + "&format=JSON"
  end
     # => "http://charts.spotify.com/api/tracks/most_streamed/fi/weekly/latest"
  def get_json
    JSON.load(open(url))  # => {"tracks"=>[{"date"=>"2015-03-15", "country"=>"FI", "track_url"=>"https://play.spotify.com/track/6oJflQkp7lFXOQce4wPTAW", "track_name"=>"Samsara", "artist_name"=>"Tungevaag & Raaban", "artist_url"=>"https://play.spotify.com/artist/4cSYNpczcvTUpnPMFDLsIc", "album_name"=>"Samsara", "album_url"=>"https://play.spotify.com/album/4rKrPkq8zi6jKmuLdzpNY2", "artwork_url"=>"http://o.scdn.co/300/b4f60550b67a5d93b1a5c4ccd9432b1b67b0a4e3", "num_streams"=>322075, "window_type"=>"weekly", "percent_male"=>48, "percent_age_group_0_17"=>0, "percent_age_group_18_24"=>39, "percent_age_group_25_29"=>11, "percent_age_group_30_34"=>5, "percent_age_group_35_44"=>8, "percent_age_group_45_54"=>4, "percent_age_group_55_plus"=>33}, {"date"=>"2015-03-15", "country"=>"FI", "track_url"=>"https://play.spotify.com/track/7y2YUIyCuVhBidENVT0068", "track_name"=>"Love Me Like You Do - From \"Fifty Shades Of Grey\"", "artist_name"=>"Ellie Goulding", "artist_url"=>"https://play.spo...
  end
  binding.pry
  #
  # def get_first_track_info(music_hash)
  #   first = music_hash["tracks"][0]                                                            # => {"date"=>"2015-03-15", "country"=>"FI", "track_url"=>"https://play.spotify.com/track/6oJflQkp7lFXOQce4wPTAW", "track_name"=>"Samsara", "artist_name"=>"Tungevaag & Raaban", "artist_url"=>"https://play.spotify.com/artist/4cSYNpczcvTUpnPMFDLsIc", "album_name"=>"Samsara", "album_url"=>"https://play.spotify.com/album/4rKrPkq8zi6jKmuLdzpNY2", "artwork_url"=>"http://o.scdn.co/300/b4f60550b67a5d93b1a5c4ccd9432b1b67b0a4e3", "num_streams"=>322075, "window_type"=>"weekly", "percent_male"=>48, "percent_age_group_0_17"=>0, "percent_age_group_18_24"=>39, "percent_age_group_25_29"=>11, "percent_age_group_30_34"=>5, "percent_age_group_35_44"=>8, "percent_age_group_45_54"=>4, "percent_age_group_55_plus"=>33}
  #   "#{first["track_name"]} by #{first["artist_name"]} from the album #{first["album_name"]}"  # => "Samsara by Tungevaag & Raaban from the album Samsara"
  # end
  #
  #
  # def most_streamed(region)
  #   url = get_url(region)            # => "http://charts.spotify.com/api/tracks/most_streamed/fi/weekly/latest"
  #   json_data = get_json(url)        # => {"tracks"=>[{"date"=>"2015-03-15", "country"=>"FI", "track_url"=>"https://play.spotify.com/track/6oJflQkp7lFXOQce4wPTAW", "track_name"=>"Samsara", "artist_name"=>"Tungevaag & Raaban", "artist_url"=>"https://play.spotify.com/artist/4cSYNpczcvTUpnPMFDLsIc", "album_name"=>"Samsara", "album_url"=>"https://play.spotify.com/album/4rKrPkq8zi6jKmuLdzpNY2", "artwork_url"=>"http://o.scdn.co/300/b4f60550b67a5d93b1a5c4ccd9432b1b67b0a4e3", "num_streams"=>322075, "window_type"=>"weekly", "percent_male"=>48, "percent_age_group_0_17"=>0, "percent_age_group_18_24"=>39, "percent_age_group_25_29"=>11, "percent_age_group_30_34"=>5, "percent_age_group_35_44"=>8, "percent_age_group_45_54"=>4, "percent_age_group_55_plus"=>33}, {"date"=>"2015-03-15", "country"=>"FI", "track_url"=>"https://play.spotify.com/track/7y2YUIyCuVhBidENVT0068", "track_name"=>"Love Me Like You Do - From \"Fifty Shades Of Grey\"", "artist_name"=>"Ellie Goulding", "artist_url"=>"https://play.s...
  #   get_first_track_info(json_data)  # => "Samsara by Tungevaag & Raaban from the album Samsara"
  # end
end
