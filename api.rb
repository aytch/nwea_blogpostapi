require 'json'
require 'sinatra'

get '/' do
  "Hello world".to_json
end

