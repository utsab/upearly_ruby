require 'sinatra'
require 'active_record'

# ------------------------------------
# models
# ------------------------------------

class User < ActiveRecord::Base; end

# ------------------------------------
# connection
# ------------------------------------

configure :development do
  ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database =>  'dev.db'
  )
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end
