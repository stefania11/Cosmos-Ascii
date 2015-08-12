require_relative 'config/environment.rb'

Terminal.clear_screen

# === Get

api = APODGet.new
apod = APOD.new(api.data)

# === Assign

text = apod.explanation
title = apod.title
ascii = AsciiArtHelper.generate_ascii(url: apod.url,
                                      width: 50,
                                      color: true,
                                      indent_depth: 2,
                                      border: false)


# === Display

Terminal.clear_screen
puts ascii
puts title.center(80)
# puts text

# === Audio

Terminal.say(text)
