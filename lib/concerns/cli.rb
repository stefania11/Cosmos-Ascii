# Tools to make building an interface a bit cleaner
module CLI
  COMMANDS_WITH_DESCRIPTIONS = YAML.load_file('lib/assets/commands.yml')

  COMMANDS = COMMANDS_WITH_DESCRIPTIONS.keys.map(&:to_s)

  def self.press_enter_to(text = 'continue')
    puts "--Press enter to #{text}"

    gets.chomp
  end

  def self.prompt(text)
    puts "--#{text}"

    gets.chomp
  end

  def self.list_commands
    list = COMMANDS_WITH_DESCRIPTIONS.map { |k, v| "#{k} - #{v}" }.join('  |  ')

    puts "  #{list}"
  end

  def self.line_break
    puts
  end

  def self.listen_for_command
    command = gets.chomp

    line_break

    parse_and_execute(command)
  end

  # User commands

  def self.r # read
    Terminal.kill_say
    puts Cosmos.most_recent_text
  end

  def self.d # display APOD for specific date
    puts 'For which day would you like to see the APOD?'

    date = prompt('Enter a date in the format YYYY-MM-DD')
    validate(date)

    Cosmos.new(date: date)
  rescue
    date_error
    d
  end

  def self.p # launch photobooth
    ImageSnapper.run

  rescue
    puts 'You need to install ImageSnap to use this feature.'
    puts 'Quit this program and run `brew install imagesnap`.'
  end

  def self.m # kill current audio
    Terminal.kill_say
    Terminal.kill_afplay
    # puts 'Mute is... coming soon! Probably.'
  end

  def self.q # quit
    adieu

    exit
  end

  private

  def date_error
    line_break
    puts "There was a problem retrieving the APOD for #{date}!"
    puts 'Please try another date.'
    line_break
  end

  def self.validate(date)
    invalid_date unless date =~ /\d{4}-\d{2}-\d{2}/
  end

  def self.invalid_date
    line_break
    puts 'The date you entered was not in the correct format.'
    line_break
    d
  end

  def self.parse_and_execute(command)
    if COMMANDS.include? command
      send(command)

    else
      puts "That's some bullshit. Try a different command."

    end
    await_next_command
  end

  def self.adieu
    puts '   Live long and prosper.  🚀'

    line_break

    sleep 0.5
  end

  def self.await_next_command
    line_break

    listen_for_command
  end
end
