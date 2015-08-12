class Cosmos
  attr_accessor :api, :apod, :text, :title, :ascii

  def initialize(date: nil)
    create_apod_object(date: date)
    assemble_pieces
    display
    cue_audio
    await_command
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
  end

  def display
    Terminal.clear_screen
    puts ascii
    puts title.center(80)
    CLI.list_commands
  end

  def cue_audio
    Terminal.say_with_music(text: text)
  end

  def await_command
    CLI.listen_for_command
  end
end
