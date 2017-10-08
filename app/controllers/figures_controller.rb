class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
   erb :'figures/new'
 end

 post '/figures' do
    @figure = Figure.new(name: params["name"])
    @figure.landmarks = Landmark.find_or_create_by(name: params["name"])
    @figure.figure_titles = params[:figure_title]
    @figure.save
  end

end
