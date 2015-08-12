require_relative 'spec_helper'

describe ApodGet do
  describe '#initialize' do
    it "does not raise error when called on with no arguments" do
      expect { ApodGet.new }.to_not raise_error
    end

    it "sets a constant 'base_url' as the root url of the Spotify Chart API" do
      expect(ApodGet::BASE_URL).to eq("https://api.nasa.gov/planetary/apod?concept_tags=True&api_key=")
    end

    let(:apod_fetched) { ApodGet.new }
    it "should have a key" do
      expect(apod_fetched.key).to_not be_empty
    end

    it "should read the key file" do
      # File.should_receive(:read ).and_return("")
      url = 'https://api.nasa.gov/planetary/apod?concept_tags=True&api_key=my_key&format=JSON'
      expect(File).to receive(:read ).and_return("my_key")
      expect_any_instance_of(ApodGet).to receive(:open).with(url).and_return('"my data"')
      instance = ApodGet.new
      expect(instance.data).to eq("my data")
    end

    it "should have correct url" do
      url = ApodGet::BASE_URL + "#{apod_fetched.key}" + '&format=JSON'
      expect(apod_fetched.url).to eq url
    end

    it "should load Json data" do
      expect(apod_fetched.data).to_not be_empty
    end

  end
end
