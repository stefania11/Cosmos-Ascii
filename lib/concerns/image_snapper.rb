# Module to take picture from cli and transform it to asci animation
module ImageSnapper
  ASCII_IMAGES = []
  NUMBER_OF_PICTURES = 7
  NUMBER_OF_LOOPS = 3
  QUOTE = "\"Space is cool and y'all are made up of star guts.\""\
          "\n\t\t\t\t\t\t-- Aliens"

  def self.welcome
    puts 'Welcome to our intergalactic photobooth from your command line!'
    CLI.press_enter_to('take a picture')
  end

  def self.take_pictures
    file = 'lib/assets/images/img.jpg'

    NUMBER_OF_PICTURES.times do
      system "imagesnap -q -w 1 #{file}"

      ascii_image = AsciiArtHelper.generate_ascii(src: "#{file}")

      ASCII_IMAGES << ascii_image
    end
  end

  def self.loop_images(n = NUMBER_OF_LOOPS)
    n.times do
      ASCII_IMAGES.each do |i|
        Terminal.clear_screen
        puts QUOTE.center(97)
        puts i
        sleep 0.5
      end
    end
  end

  def self.file_write
    File.open('lib/assets/images/images.yml', 'w') do |f|
      f.write(ASCII_IMAGES.to_yaml)
    end
  end

  def self.run
    welcome
    take_pictures
    loop_images(4)
    CLI.list_commands
  end
end
