class LandmarksController < ApplicationController

  get '/' do
    redirect '/landmarks'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    @figures = Figure.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks' do
     @landmark = Landmark.find_by_id(params[:id])
     @landmark.name = params["landmark"]["name"]
     @landmark.year_completed = params["landmark"]["year_completed"]
     @landmark.save
     redirect "/landmarks/#{@landmark.id}"
   end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect '/landmarks'
  end

end
