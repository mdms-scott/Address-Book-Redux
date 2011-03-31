require 'bundler/setup'
require 'sinatra'
require 'mongo_mapper'
require 'haml'

MongoMapper.database = 'address_book'

require 'ab/core'
require 'ab/models'