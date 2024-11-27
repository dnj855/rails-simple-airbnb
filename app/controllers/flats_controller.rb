class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show update edit destroy]
  def index
    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where('name LIKE ?', "%#{params[:query]}%")
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @flats = Flat.all
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :rating)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end