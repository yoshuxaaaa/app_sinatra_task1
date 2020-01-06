# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
# require 'active_record'
# require 'sinatra/activerecord'
require_relative './models/post.rb'

get '/' do
  @posts = Post.all
  erb :index
end

get '/new' do
  erb :new
end

post '/create' do
  Post.create(params[:title], params[:content])
  redirect '/'
end

get '/show/:id' do
  @posts = Post.find(params[:id])
  erb :show
end

get '/edit/:id' do
  @posts = Post.find(params[:id])
  erb :edit
end

patch '/edit/:id' do
  Post.patch(params[:id], params[:title], params[:content])
  redirect '/show/' + params[:id]
end

delete '/delete/:id' do
  Post.delete(params[:id])
  redirect '/'
end
