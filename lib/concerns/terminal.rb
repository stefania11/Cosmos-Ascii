module Terminal
  VOICES = YAML.load_file('lib/assests/voices.yml')

  def self.clear_screen
    puts "\e[H\e[2J"
  end

  def self.line_break
    puts
  end

  def self.say(text, voice = VOICES.sample)
    cmd = "say -v #{voice} \"#{text}\""
    `#{cmd}`
  end

  def self.open(thing)
    cmd = "open #{thing}"
    `#{cmd}`
  end
end
