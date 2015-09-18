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
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @photo = Photo.new
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
    if @place.valid?
      redirect_to root_path, notice: "Successfully Updated"
    else
      render :edit, :status => :unprocessable_entity
    end
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
