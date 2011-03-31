require 'bundler/setup'
require 'sinatra'
require 'mongo_mapper'
require 'haml'

if ENV['MONGOHQ_URL']
  puts "Running on MongoHQ" 
  MongoMapper.connection = Mongo::Connection.new(ENV['MONGOHQ_URL'])
else
  puts "Using local database" 
  MongoMapper.database = 'address_book'
end


require 'ab/core'
require 'ab/models'