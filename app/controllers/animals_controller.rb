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

  def new
    @animal = Animal.new
  end

  def create
    # without strong params
    # @animal = Animal.new(
    #     name: params[:animal][:name],
    #     species: params[:animal][:species],
    #     age: params[:animal][:age]
    # )

    # with strong params
    @animal = Animal.new(animal_params)

    if @animal.save
      redirect_to animals_path
    else
      render :new, :bad_request
    end

  end

  private

  def animal_params
    return params.require(:animal).permit(:name, :species, :age)
  end


end
