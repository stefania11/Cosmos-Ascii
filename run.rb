require_relative 'config/environment.rb'

api = ApodGet.new
apod = Apod.new(api.data)

ascii = AsciiArtHelper.generate_ascii(url: apod.url,
                                      width: 50,
                                      color: true,
                                      indent_depth: 2,
                                      border: false)

text = apod.explanation
title = apod.title

# ===

puts "\e[H\e[2J"
puts ascii
puts title.center(80)
puts text

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

cmd = "say -v #{voice.sample} \"#{apod.explanation}\""
`#{cmd}`
