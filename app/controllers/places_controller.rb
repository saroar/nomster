class PlacesController < ApplicationController
  before_action :find_pace, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!, :only => [:new, :create]

  def index
    @places = Place.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 3 )
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @place.update_attributes(place_params)
    redirect_to root_path, notice: "Edit save"
  end

  def destroy
    @place.destroy
    redirect_to root_path, notice: "Successfully deleted place"
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address )
  end

  def find_pace
    @place = Place.find(params[:id])
  end
end
