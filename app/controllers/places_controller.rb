class PlacesController < ApplicationController
  before_action :find_place, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, :except => [:index, :show]

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
    if @place.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end
  end

  def update
    if @place.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end

    @place.update_attributes(place_params)
    redirect_to root_path, notice: "Edit save"
  end

  def destroy
    if @place.user != current_user
      return render :text => 'Not Allowed', :status => :forbidden
    end

    @place.destroy
    redirect_to root_path, notice: "Successfully deleted place"
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address )
  end

  def find_place
    @place = Place.find(params[:id])
  end
end
