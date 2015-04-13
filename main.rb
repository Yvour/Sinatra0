#!/usr/bin/env ruby
# encoding: utf-8
# main.rb
# -*- coding: utf-8 -*-

require 'sinatra'
require 'sinatra/activerecord'
require 'redcarpet'
require 'debugger'
#require "pdf/writer"
#require 'net/http'
=begin
require "dm-core"
#for using auto_migrate!
require "dm-migrations"
require "digest/sha1"
require 'rack-flash'
require "sinatra-authentication"

use Rack::Session::Cookie, :secret => 'A1 sauce 1s so good you should use 1t on a11 yr st34ksssss'
#if you want flash messages
use Rack::Flash


use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'admin' and password == 'admin'
end

=end


$LOAD_PATH.unshift(File.dirname(__FILE__) + '/app')
require 'models'  # здесь живут модели
require 'routes'  # маршруты
require 'helpers' # и хелперы
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/config')
require 'environments' # настройки конфигурации
require 'constants'    # константы
# или короче
# Dir.glob('./{app,config}/*.rb').each {|file| require file}