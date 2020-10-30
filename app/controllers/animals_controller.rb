class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def show
    # find animal by their params[:id]
    @animal = Animal.find_by(id: params[:id])

    if @animal.nil?
      redirect_to animals_path
      return
    end

  end


end
