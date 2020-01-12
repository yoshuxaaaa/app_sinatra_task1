# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
# require 'active_record'
# require 'sinatra/activerecord'
require_relative './models/post.rb'

get '/' do
  @posts = Post.new.all
  erb :index
end

get '/new' do
  erb :new
end

post '/create' do
  Post.new.create(params[:title], params[:content])
  redirect '/'
end

get '/show/:id' do
  @posts = Post.new.find(params[:id])
  erb :show
end

get '/edit/:id' do
  @posts = Post.new.find(params[:id])
  erb :edit
end

patch '/edit/:id' do
  Post.new.patch(params[:id], params[:title], params[:content])
  redirect '/show/' + params[:id]
end

delete '/delete/:id' do
  Post.new.delete(params[:id])
  redirect '/'
end
