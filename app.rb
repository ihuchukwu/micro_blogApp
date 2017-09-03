require 'sinatra'
require 'sinatra/activerecord'
require 'bundler/setup'
require 'sinatra/flash'

require 'pry'
require './models'

set :database, {adapter: "sqlite3", database: "development.sqlite3"}

enable :sessions

def current_user
 @current_user ||= User.find_by_id(session[:user_id])
end

get '/signup' do
 erb :signup
end

post '/login' do
   @user = User.find_by(username: params[:username])
   if @user && @user.password == params[:password]
   session[:user_id] = @user.id
       redirect '/'
   else
       redirect '/signup'
   end
end

get '/logout' do
   session[:user_id] = nil
   redirect '/signup'
end

post '/new_user' do
   user = User.create(username: params[:username], password: params[:password], portfolio: params[:portfolio], about: params[:about], quest_book: params[:quest_book])
   session[:user_id] = user.id
   redirect "/"
end

post '/destroy_user' do
   user = User.find(session[:user_id])
   user.destroy
   redirect '/signup'
end

post '/edit_user' do
   user = User.find(session[:user_id])
   user.update(password: params[:password], portfolio: params[:portfolio], about: params[:about], quest_book: params[:quest_book])
   redirect '/'
end

get '/users'  do
@users = User.all
erb :users
end

get '/users/:id' do
@user = User.find(params[:id])
@posts = Post.where(user_id: params[:id])
erb :user
end

get '/' do
   @posts = Post.all
 erb :index
end

post '/post' do
   user = User.find(session[:user_id])
   Post.create(content: params[:content], user_id: user.id, category: params[:category], title: params[:title])
   redirect "/"
end
