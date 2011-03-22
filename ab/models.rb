class Person
  include MongoMapper::Document
  
  key :name, String
  
end