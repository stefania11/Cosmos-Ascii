require_relative 'spec_helper'
temp_data = {
  url: 'http://apod.nasa.gov/apod/image/1508/BlueMoonHalo_Hang_960.jpg',
  media_type: 'image',
  explanation: "Have you ever seen a halo around the Moon? Such 22 degree rings around the Moon -- caused by ice crystals falling in the Earth's atmosphere -- are somewhat rare. OK, but have you ever seen a blue moon? Given the modern definition of blue moon -- the second full moon occurring in a calendar month -- these are also rare. What is featured above might therefore be considered doubly rare -- a halo surrounding a blue moon. The featured image was taken late last month near Zhongshan Station in Antarctica. Visible in the foreground are a power generating house and a snowmobile. What might seem to be stars in the background are actually illuminated snowflakes near the camera.",
  concepts: [],
  title: 'A Blue Moon Halo over Antarctica'
}

describe ApodGet do
  describe '#initialize' do
    it "does not raise error when called on with no arguments" do
      expect { ApodGet.new }.to_not raise_error
    end

    it "sets a constant 'base_url' as the root url of the Spotify Chart API" do
      expect(ApodGet::BASE_URL).to eq("https://api.nasa.gov/planetary/apod?api_key=")
    end

    let(:apod_fetched) { ApodGet.new }
    it "should have a key" do
      expect(:apod_fetched.key).to_not be_empty
    end

    it "should read the key file" do
      File.should_receive(:read)
    end

    it "should have correct url" do
      expect(:apod_fetched.url).to_eq "#{BASE_URL}" + "#{apod_fetched.key}" + '&format=JSON'
    end

    it "should load Json data" do
      expect(:apod_fetched.data).to_not be_empty
    end

  end
end
