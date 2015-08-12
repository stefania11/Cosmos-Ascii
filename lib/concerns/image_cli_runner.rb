require_relative '../../config/environment'
require 'yaml'
IMAGES = []
puts "Welcome to Image snapper from your command line! Press enter to take a picture "
file="lib/assests/images/#{Time.now.to_i}.jpg"
user_input = gets.chomp

  def count_down
    3.downto(1) do |i|
      puts i
      sleep 0.2
    end
  end

  7.times do
    system "imagesnap -q -w 1 #{file}"
    new_image = AsciiArtHelper.generate_ascii(url: "#{file}",
                                          width: 50,
                                          color: true,
                                          indent_depth: 2,
                                          border: false)
    IMAGES << new_image
  end
  3.times do
    IMAGES.each do |i|
      puts "\e[H\e[2J"
      puts i
      sleep 0.5
    end
end
File.open('lib/assests/images.yml', 'w') do |f|
  f.write(IMAGES.to_yaml)
end
