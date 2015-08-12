module TextUI
  def self.clear_scroll
    cmd = 'clear'
    `#{cmd}`
  end

  # TODO: put this here?
  # def self.say(text)
  #   cmd = "say -v #{voice.sample} \"#{apod.explanation}\""
  #   `#{cmd}`
  # end
end
