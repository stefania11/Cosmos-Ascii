# Tools to make communication between ruby and bash a bit simpler
module Terminal
  # VOICES = YAML.load_file('lib/assets/voices.yml')
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
    system(cmd)
  end

  def self.afplay(file)
    cmd = "afplay #{file}"
    system(cmd)
  end

  def self.say_with_music(text: 'Space is cool.',
                          music: MUSIC.sample,
                          voice: NONMUSICAL_VOICES.sample,
                          volume: 0.5)

    cmd = "say -v #{voice} \"#{text}\""\
          " & sleep 4 && afplay -v #{volume} #{music} &"

    system(cmd)
  end

  def self.kill_say
    cmd = "kill -15 $(ps aux | pgrep -l say | egrep -o '\\d+') &> /dev/null"
    system(cmd)
  end

  def self.kill_afplay
    cmd = "kill -15 $(ps aux | pgrep -l afplay | egrep -o '\\d+') &> /dev/null"
    system(cmd)
  end
end
