module CLI
  COMMANDS_WITH_DESCRIPTIONS = YAML.load_file('lib/assets/commands.yml')
  COMMANDS = COMMANDS_WITH_DESCRIPTIONS.keys.map(&:to_s)
  DESCRIPTIONS = COMMANDS_WITH_DESCRIPTIONS.values
  COMMANDS_OR_DESCRIPTIONS = COMMANDS + DESCRIPTIONS

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
end
