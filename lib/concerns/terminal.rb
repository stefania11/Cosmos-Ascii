module Terminal
  VOICES = YAML.load_file('lib/assets/voices.yml')
  NONMUSICAL_VOICES = YAML.load_file('lib/assets/nonmusical_voices.yml')
  MUSIC = Dir['lib/assets/music/*.m4a']

  def self.clear_screen
    puts "\e[H\e[2J"
  end

  def self.line_break
    puts
  end

  def self.say(text, voice = VOICES.sample)
    cmd = "say -v #{voice} \"#{text}\""
    system(cmd)
  end

  def self.open(thing)
    cmd = "open #{thing}"
    `#{cmd}`
  end

  def self.afplay(file)
    cmd = "afplay #{file}"
    system(cmd)
  end

  def self.say_with_music(text:, m: MUSIC.sample, v: NONMUSICAL_VOICES.sample)
    cmd = "say -v #{v} \"#{text}\" & sleep 4 && afplay -v 0.09 #{m} &"
    system(cmd)
  end
end
