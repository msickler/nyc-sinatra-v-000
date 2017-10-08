class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
   erb :'/figures/new'
 end

 get '/figures/:id' do
   @figure = Figure.find_by_id(params[:id])
   erb :'/figures/show'
 end

 post '/figures' do
    @figure = Figure.new(name: params["name"])
    @figure.landmarks = Landmark.find_or_create_by(name: params["name"])
    @figure.figure_titles = params[:figure_title]
    @figure.save
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.titles = Title.find_or_create_by(title_id: params["title_id"]) if !params["title_id"].empty?
    @figure.landmarks = Landmark.find_or_create_by(landmark_id: params["landmark_id"]) if !params["landmark_id"].empty?
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
