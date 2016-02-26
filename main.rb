require 'sinatra'
require 'sinatra/namespace'
require 'json'

get '/' do
  'Welcome!'
end

namespace '/api' do
  before { content_type :json }

  get '/keys' do
    File.read('data/keys.json')
  end

  get '/keys/:id' do
    begin
      File.read("data/keys/#{params[:id]}.json")
    rescue
      status 404 # Not found
      body({ error: "Could not find any key with id #{params[:id]}" }.to_json)
    end
  end
end
