# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require_relative 'models/post.rb'

get '/memos' do
  @posts = Post.all
  erb :index
end

get '/memos/new' do
  erb :new
end

post '/memos' do
  Post.create(params[:title], params[:content])
  redirect '/memos'
end

get '/memos/:id' do
  @posts = Post.find(params[:id])
  erb :show
end

get '/memos/:id/edit' do
  @posts = Post.find(params[:id])
  erb :edit
end

patch '/memos/:id' do
  Post.patch(params[:id], params[:title], params[:content])
  redirect '/memos/' + params[:id]
end

delete '/memos/:id' do
  Post.delete(params[:id])
  redirect '/memos'
end
