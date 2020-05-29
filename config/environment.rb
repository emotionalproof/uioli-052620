require 'bundler'
Bundler.require

require 'pry'
require "tty-prompt"
require_relative '../bin/pre_search_helpers.rb'
require_relative '../bin/post_search_helpers.rb'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

