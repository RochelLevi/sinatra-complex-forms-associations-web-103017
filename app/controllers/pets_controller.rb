class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    erb :'/pets/new'

  end

  post '/pets' do
    @pet = Pet.create(params[:pet])
    if !params[:owner_name].empty?
      @pet.owner = Owner.create(name: params[:owner_name])
      @pet.save
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do
    @pet = Pet.find(params[:id])

    if params[:pet][:owner_id] == "on"
      @pet.name = (params[:pet][:name])
      @pet.owner = Owner.create(name: params[:owner][:name])
      @pet.save

    else
      @pet.update(params[:pet])
    end
    
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id].to_i)
    erb :'/pets/edit'
  end
end
