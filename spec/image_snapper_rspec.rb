# TODO: move out of development...

# require_relative 'spec_helper'
# describe ImageSnapper do
#   describe 'welcome' do
#     it "displays welcome message" do
#       expect { ImageSnapper.welcome }.to stdout('Welcome to our intergalactic photobooth from your command line!')
#     end
#   end
#
#   describe 'take_pictures' do
#     it "sets a constant as iterator" do
#       expect(ImageSnapper::NUMBER_OF_PICTURES).to eq(7)
#     end
#
#     it "should create an image file" do
#       expect(file).to eq("'lib/assests/images/#{Time.now.to_i}.jpg'")
#     end
#
#     it "should shovel new pictures to array of pictures" do
#       expect(ImageSnapper::IMAGES).to_not be_empty
#     end
#   end
#
#   describe 'loop_images' do
#     it "shoud take a default loop number constant" do
#       expect(ImageSnapper::NUMBER_OF_LOOPS).to_eq(3)
#     end
#
#     it "should print the images in a loop" do
#       expect(ImageSnapper.loop_images(5)).to stdout 21.times
#     end
#   end
#
#   describe 'file_write' do
#     it "should add images to a yaml file" do
#       expect(File.open('lib/assests/images.yml')).to_not be_empty
#     end
#   end
# end
