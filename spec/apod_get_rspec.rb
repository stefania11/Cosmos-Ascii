require_relative 'spec_helper'

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
