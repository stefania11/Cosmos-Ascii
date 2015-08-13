# class getting image of the day from Nasa
class APODGet
  BASE_URL = 'https://api.nasa.gov/planetary/apod?concept_tags=True&api_key='

  attr_accessor :key, :url, :data

  def initialize(date: nil)
    # binding.pry
    @key = File.read('key')
    @date = date
    @url = "#{BASE_URL}#{@key}#{'&date=' if date}#{@date}&format=JSON"
    @data = JSON.load(open(url))
  rescue
    create_key_for_user
    setup
  end

  private

  def add_date
    @url = "#{url}&date=#{date}"
  end

  def setup
    @key = File.read('key')
    @url = "#{BASE_URL}#{@key}&format=JSON"
    @data = JSON.load(open(url))
  end

  def create_key_for_user
    print_instructions
    send_to_nasa
    create_key_file
  end

  def print_instructions
    puts "Before we get to space stuff, let's get you an API key."
    CLI.press_enter_to('continue')

    puts 'All you need to do is register with NASA and paste your API key here.'
    puts 'You will only need to do this once.'
    CLI.press_enter_to('visit the NASA site and register for a key')
  end

  def send_to_nasa
    Terminal.open('https://api.nasa.gov/index.html#apply-for-an-api-key')
  end

  def create_key_file
    key = CLI.prompt("When you've got the key, copy and paste it here:")
    File.open('key', 'w') { |f| f.write(key) }
  end
end
