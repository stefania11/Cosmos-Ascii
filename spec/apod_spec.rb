# TODO: move out of development...

# require_relative 'spec_helper'
#
# temp_data = {
#   url: 'http://apod.nasa.gov/apod/image/1508/BlueMoonHalo_Hang_960.jpg',
#   media_type: 'image',
#   explanation: "Have you ever seen a halo around the Moon? Such 22 degree rings around the Moon -- caused by ice crystals falling in the Earth's atmosphere -- are somewhat rare. OK, but have you ever seen a blue moon? Given the modern definition of blue moon -- the second full moon occurring in a calendar month -- these are also rare. What is featured above might therefore be considered doubly rare -- a halo surrounding a blue moon. The featured image was taken late last month near Zhongshan Station in Antarctica. Visible in the foreground are a power generating house and a snowmobile. What might seem to be stars in the background are actually illuminated snowflakes near the camera.",
#   concepts: [],
#   title: 'A Blue Moon Halo over Antarctica'
# }
#
# describe Apod do
#   let(:apod) { Apod.new(temp_data) }
#
#   it 'has multiple instance variables' do
#     expect(apod.instance_variables).to_not be_empty
#   end
#
#   it 'has a reader method for each instance variable' do
#     instance_variables = apod.instance_variables
#     result = instance_variables.all? { |e|
#       e = e.to_s
#
#       thi = e.respond_to? e.to_s[2..-1]
#     binding.pry }
#     expect(result).to be true
#   end
# end
