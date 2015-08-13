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
    parse_and_execute(command)
  end

  # User commands

  def self.r
    line_break
    puts Cosmos.most_recent_text
  end

  def self.d
    puts 'Search by date--coming soon!'
  end

  def self.p
    ImageSnapper.run
  end

  def self.m
    puts 'Mute is... coming soon! Probably.'
  end

  def self.q
    adieu
    exit
  end

  private

  def self.parse_and_execute(command)
    if COMMANDS.include? command
      send(command)

    else
      puts "That's some bullshit. Try again."

    end

    await_next_command
  end

  def self.adieu
    puts 'Live long and prosper. \\\\//'
    line_break
    sleep 1
  end

  def self.await_next_command
    line_break
    list_commands
    listen_for_command
  end
end
