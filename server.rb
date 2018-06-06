require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require "csv"
require 'shotgun'
require 'date'
enable :sessions

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do

  erb :index
end

get '/reports' do
  @data = CSV.read('data.csv', headers: true)

  erb :reports
end
