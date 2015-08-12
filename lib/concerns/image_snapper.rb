module ImageSnapper
  IMAGES = []
  NUMBER_OF_PICTURES = 7
  NUMBER_OF_LOOPS = 3

  def self.welcome
    puts "Welcome to Image snapper from your command line!"
    CLI.press_enter_to('take a picture')
  end

  def self.count_down
    3.downto(1) do |i|
      puts i
      sleep 0.2
    end
  end

  def self.take_pictures
    file="lib/assests/images/#{Time.now.to_i}.jpg"
    NUMBER_OF_PICTURES.times do
      system "imagesnap -q -w 1 #{file}"
      new_image = AsciiArtHelper.generate_ascii(url: "#{file}")
    end
  end

  def self.loop_images(times =NUMBER_OF_LOOPS)
    times.times do
      IMAGES.each do |i|
        Terminal.clear_screen
        puts i
        sleep 0.5
      end
    end
  end

  def self.file_write
    File.open('lib/assests/images.yml', 'w') do |f|
      f.write(IMAGES.to_yaml)
    end
  end

  def self.run
    ImageSnapper.welcome
    ImageSnapper.take_pictures
    ImageSnapper.loop_images(4)
  end
end
