require_relative 'config/environment.rb'

stuff = ApodGet.new
apod = Apod.new(stuff.data)
binding.pry
