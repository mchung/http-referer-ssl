require 'rubygems'
require 'bundler'
require 'uri'
require 'cgi'

Bundler.require

class App < Sinatra::Base
  get '/' do
    if env['HTTP_REFERER'] || true
      value = env['HTTP_REFERER']
      value = 'https://encrypted.google.com/url?sa=t&rct=j&q=%22spicy%20and%20cheese%20you%20will%20find%20in%20microwave%20buffalo%20chicken%22&source=web&cd=1&ved=0CCsQFjAA&url=https%3A%2F%2Fhttp-referer-ssl.herokuapp.com%2F&ei=2_H6TuDTMciuiQLti9GODQ&usg=AFQjCNECzgL9G-1nmvpeyoV0TK9Nq2As5g&sig2=5POJg6eSeCwy9SL0iplUuw'
      uri = URI.parse(value)
      uri_params = CGI.parse(uri.query)
      @q = uri_params['q'].first
    end

    haml :index, :format => :html5
  end
end

run App