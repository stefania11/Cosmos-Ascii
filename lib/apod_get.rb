# class getting image of the day from Nasa
class ApodGet
  BASE_URL = 'https://api.nasa.gov/planetary/apod?api_key='

  attr_accessor :key, :url, :data

  def initialize
    @key = File.read('key')
    @url = BASE_URL + key + '&format=JSON'
    @data = JSON.load(open(url))
  end
end
