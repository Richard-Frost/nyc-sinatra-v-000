
class FiguresController < ApplicationController

  get '/figures' do 
    @figures = Figure.all 
    erb :'/figures/index'
  end

  get '/figures/new' do 
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    erb :'figures/edit'
   end

  post '/figures' do
    @figure = Figure.create(params["figure"])
    @figure.title_ids << params[:figure][:title_ids]
    @figure.landmark_ids << params[:figure][:landmark_ids]
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
  end

  post '/figures/:id' do 
    @figure = Figure.find_by(id: params[:id])
    @figure.name = params[:figure][:name]
    @figure.save
    if !params[:landmark][:name].empty?
    @figure.landmark.name << params["landmark"]["name"]
  end
    redirect to "/figures/#{@figure.id}"
  end
end


