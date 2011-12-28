require 'rubygems'
require 'bundler'

Bundler.require

class App < Sinatra::Base
  get '/' do
    haml :index, :format => :html5
  end
end

run App