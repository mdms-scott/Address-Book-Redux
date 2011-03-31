require 'bundler/setup'
require 'sinatra'
require 'mongo_mapper'
require 'haml'

if ENV['MONGOHQ_HOST']
  puts "Running on MongoHQ" 
  MongoMapper.connection = Mongo::Connection.new(ENV['MONGOHQ_HOST'], ENV['MONGOHQ_PORT'])
  MongoMapper.database = ENV['MONGOHQ_DATABASE']
  MongoMapper.database.authenticate(ENV['MONGOHQ_USER'],ENV['MONGOHQ_PASSWORD'])
else
  puts "Using local database" 
  MongoMapper.database = 'address_book'
end


require 'ab/core'
require 'ab/models'