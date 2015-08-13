# Creates instances of the program, essentially
class Cosmos
  attr_accessor :api, :apod, :text, :title, :ascii

  @all_texts = []
  @all_img_src = []

  class << self
    attr_accessor :all_texts, :all_img_src

    def most_recent_text
      all_texts.last
    end

    def most_recent_img_src
      all_img_src.last
    end
  end

  def initialize(date: nil)
    create_apod_object(date: date)
    assemble_pieces
    display
    Terminal.say_with_music(text: text)
    CLI.listen_for_command
  end

  private

  def create_apod_object(date: nil)
    @api = APODGet.new(date: date)
    @apod = APOD.new(@api.data)
  end

  def assemble_pieces
    @text = apod.explanation
    @title = apod.title
    @ascii = AsciiArtHelper.generate_ascii(src: apod.url)

    Cosmos.all_texts << text
    Cosmos.all_img_src << apod.url
  end

  def display
    Terminal.clear_screen
    puts ascii
    puts title.center(80)
    CLI.list_commands
  end
end
