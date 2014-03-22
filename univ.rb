require 'dm-core'
require 'dm-migrations'
require 'date'
class Presentation 
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :content, Text
  belongs_to :user
end

class User 
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :password, String
  has n, :presentations
end

DataMapper.setup(:default,"sqlite:///#{Dir.pwd}/baza.db")
DataMapper.finalize
DataMapper.auto_upgrade!
