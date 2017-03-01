require 'json'
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new('blog.db')

get '/' do
  File.open('README.md')
end

get '/posts' do
  arr = []
  db.execute('SELECT * FROM posts') do |row|
    arr += row
  end
  arr.to_json
end
