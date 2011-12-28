require 'rubygems'
require 'bundler'

Bundler.require

class App < Sinatra::Base
  get '/' do
    'spicy and cheese you will find in microwave buffalo chicken'
  end
end

run App