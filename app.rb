# app.rb
require 'sinatra'
require 'dm-core'
require 'dm-migrations'

class Presentation 
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :content, String
  property :slide1, String
end

configure do
  DataMapper.setup(:default, 
     (ENV["DATABASE_URL"] || "sqlite:///#{Dir.pwd}/baza.db"))
  DataMapper.auto_upgrade!
end

get '/' do
  haml :index
end

post '/' do
	Presentation.create(:name => params[:name], :content => params[:content], :slide1 => params[:picture])
	redirect to '/presentations'	
end

get '/presentations' do
	@presentations = Presentation.all
	@count = Presentation.all.count
	haml :presentations
end
