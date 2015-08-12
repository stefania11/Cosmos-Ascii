require 'bundler/setup'
Bundler.require(:default, :development)

require 'json'
require 'open-uri'
require 'yaml'

require_relative '../lib/apod.rb'
require_relative '../lib/apod_get.rb'

require_relative '../lib/concerns/ascii_art_helper'
require_relative '../lib/concerns/terminal'
require_relative '../lib/concerns/cli'
require_relative '../lib/concerns/image_snapper.rb'
