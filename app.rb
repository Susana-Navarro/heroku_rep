require 'sinatra'
require 'sinatra/activerecord'
configure(:development){set :database, "sqlite3:1stdatabse.sqlite3"}
require './models'
set :sessions, true

require 'bundler/setup'
require 'rack-flash'
use Rack::Flash, :sweep => true
def current_user
	if session[:user_id]
		@current_user = User.find(session[:user_id])
	end
end

get '/' do
	  
	  redirect '/sign_in'
end

get '/sign_up' do
	erb :sign_up
end
post '/sign-up-process' do
	User.create()
	   "A user is new"
	@user=User.last
	@user.fname = params[:fname]
    @user.lname = params[:lname]
    @user.email = params[:email]
    @user.bday = params[:bday]
    @user.password = params[:password]
    @user.save
    session[:user_id] = @user.id
    redirect "/home"
end
post '/post-process' do
	Post.create()
get '/' do
	redirect '/sign_in'
end
get '/sign_in' do
	erb :sign_in
end

post '/sign-in-process' do
	@user = User.find_by_email params[:email]
	if @user && @user.password == params[:password]
		session[:user_id] = @user.id
		flash[:message] = "you have logged in."
		redirect '/home'
	else 
		flash[:message] = "you couldn't log in. :("
		redirect '/sign_in'
	end
end
get '/home' do
	current_user
	erb :home
end
get '/sign_out' do
  session.clear
  redirect to('/sign_in')
end