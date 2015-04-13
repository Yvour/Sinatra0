# config/environments.rb
# настройки при разработке приложения
#configure :development do
# set :database, 'sqlite3:///dev.db'
# set :show_exceptions, true
#end

configure :development do
 db = URI.parse(ENV['DATABASE_URL'] || 'mysql:///localhost/sinatra0')

 ActiveRecord::Base.establish_connection(
   :adapter  => 'mysql2',
   :host     => 'localhost',
   :username => 'root',
   :password => 'sc0tt',
   :database => 'sinatra0',
   :encoding => 'utf8'
 )
end


# настройки для production-окружения
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