require 'bundler/setup'
Bundler.require(:default, :development)

require 'json'
require 'open-uri'

require_relative '../lib/apod.rb'
require_relative '../lib/apod_get.rb'
