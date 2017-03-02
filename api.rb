require 'json'
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new('blog.db')
db.execute "CREATE TABLE IF NOT EXISTS posts(post_id INTEGER PRIMARY KEY ASC, title TEXT, body TEXT)"

get '/posts' do
  posts = db.execute('SELECT * FROM posts;')
  posts.to_json
end

post '/post' do
  begin
    data = JSON.parse(request.body.read)
  rescue JSON::Exception => e
    puts "Exception occured"
    puts e
  end
  post_id = db.get_first_value('SELECT count(*) FROM posts') + 1 
  begin
    db.transaction
    db.execute(
      "INSERT INTO posts (post_id, title, body) " +
      "VALUES (#{post_id}, #{data['title'].to_s}, #{data['body'].to_s})"
    )
    db.commit
  rescue SQLite3::Exception => e 
    puts "Exception occurred"
    puts e
    db.rollback
  end
end
