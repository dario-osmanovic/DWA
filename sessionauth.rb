# sessionauth.rb
require 'sinatra/base'
module Sinatra
  module SessionAuth
    module Helpers
      def authorized?
        session[:authorized]
      end
      def authorize!
        redirect '/' unless authorized?
      end
      def logout!
        session[:authorized] = false
      end
    end
    def self.registered(app)
    	app.helpers SessionAuth::Helpers
	    app.set :username, 'admin'
	    app.set :password, 'password'
   	 
   	 app.post '/login' do
   	   if params[:user] == options.username && params[:pass] == options.password
   	     session[:authorized] = true
			  if params[:content] == ''
					redirect '/'			 
			  else
				  session[:content] = params[:content]
				  redirect '/preview'
			  end
   	   else
   	     session[:authorized] = false
   	     redirect '/'
   	   end
   	 end

    end
  end
  register SessionAuth
end
