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

  # will find the animal to edit
  def edit
    @animal = Animal.find_by(id: params[:id])

    if @animal.nil?
      redirect_to animals_path
    end

  end

  def update
    @animal = Animal.find_by(id: params[:id])

    if @animal.nil?
      redirect_to animals_path
    elsif @animal.update(animal_params)
      redirect_to animals_path
      return
    else
      # still don't know what the render is doing or why we need it
      # render is different from redirect_to because it doesn't go through another HTTP request cycle. it shows the view page as is
      render :edit
      return
    end

  end

  def destroy
    # should use local variable because we're not using it in our delete view
    @animal = Animal.find_by(id: params[:id])

    if @animal.nil?
      head :not_found
      return
    else
      @animal.destroy
      redirect_to animals_path
    end
  end

  private

  def animal_params
    return params.require(:animal).permit(:name, :species, :age)
  end


end
