require 'rubygems'
require 'bundler'
require 'uri'
require 'cgi'

Bundler.require

class App < Sinatra::Base
  get '/' do
    if env['HTTP_REFERER']
      value = env['HTTP_REFERER']
      uri = URI.parse(value)
      uri_params = CGI.parse(uri.query)
      @q = uri_params['q'].first
    end

    haml :index, :format => :html5
  end
end

run App