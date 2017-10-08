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
    @figure = Figure.new(params[:figure])
    @figure.titles << Title.new(name: params[:title][:name]) unless params[:title][:name].empty?
    @figure.landmarks << Landmark.new(name: params[:landmark][:name]) unless params[:landmark][:name].empty?
    @figure.save
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    @figure.titles << Title.new(name: params[:title][:name]) unless params[:title][:name].empty?
    @figure.landmarks << Landmark.new(name: params[:landmark][:name]) unless params[:landmark][:name].empty?
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

end
