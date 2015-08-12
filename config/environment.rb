require 'bundler/setup'
Bundler.require(:default, :development)

require 'json'
require 'open-uri'

require_relative '../lib/apod.rb'
require_relative '../lib/apod_get.rb'

require_relative '../lib/concerns/ascii_art_helper'
require_relative '../lib/concerns/text_ui'
