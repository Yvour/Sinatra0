#\ -w -p 4000 # указать желаемый порт
#config.ru
require_relative './main.rb' # подгрузить main.rb
run Sinatra::Application # запустить приложение