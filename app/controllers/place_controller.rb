class PlaceController < ApplicationController

  def index
    @places = Place.all
  end

  def delete
    Place.find(params[:name]).destroy
    redirect_to :action => 'index'
  end

  def show
    @place = Place.find_by(:name => params[:id])
    @posts = Post.where(place_id: @place.id)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.created_at = Time.now
    @place.updated_at = Time.now
   if @place.save
    redirect_to :action => 'index'
   else
      @places = Place.all
      render :action => 'new'
   end
  end

  def place_params
    params.require(:places).permit(:name)
  end
end
