require_relative 'config/environment.rb'

api = ApodGet.new
apod = Apod.new(api.data)
image = AsciiArt.new(apod.url)
ascii = image.to_ascii_art(color: true, width: 60)
puts ascii.rjust(20)
puts apod.explanation
voice = %w( Agnes
    Kathy
    Princess
    Vicki
    Victoria
    Alex
    Bruce
    Fred
    Junior
    Ralph
    Albert
    Bad\ News
    Bahh
    Bells
    Boing
    Bubbles
    Cellos
    Deranged
    Good\ News
    Hysterical
    Pipe\ Organ
    Trinoids
    Whisper
    Zarvox )

# cmd ="say -v #{voice.sample} \"#{apod.explanation}\""
# `#{cmd}`
