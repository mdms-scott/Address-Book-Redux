class Person
  include MongoMapper::Document
  
  key :first_name, String
  key :last_name, String
  key :company, String
  key :phone, String
  key :email, String

  timestamps!
  
  validates_presence_of :first_name
  validates_presence_of :last_name
end