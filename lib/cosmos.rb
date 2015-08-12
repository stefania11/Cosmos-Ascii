class Cosmos
  include Terminal
  include CLI

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
    @text = @apod.explanation
    @title = @apod.title
    @ascii = AsciiArtHelper.generate_ascii(url: @apod.url,
                                           width: 50,
                                           color: true,
                                           indent_depth: 2,
                                           border: false)
  end

  def display
    clear_screen
    puts ascii
    puts title.center(80)
    CLI.list_commands
  end

  def cue_audio
    say_with_music(text: text)
  end

  def await_command
    CLI.listen_for_command
  end
end
