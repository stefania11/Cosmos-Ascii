module CLI
  COMMANDS = YAML.load_file('lib/assets/commands.yml')

  def self.press_enter_to(text = 'continue')
    puts "--Press enter to #{text}"
    gets.chomp
  end

  def self.prompt(text)
    puts "--#{text}"
    gets.chomp
  end

  def self.list_commands
    list = COMMANDS.map { |k, v| "#{k} - #{v}" }.join('  |  ')
    puts "  #{list}"
  end
end
