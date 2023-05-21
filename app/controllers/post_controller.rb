class PostController < ApplicationController

  def index
    @posts = Post.all
    @places = Place.all
  end

  def delete
    Post.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def show
    @post = Post.find_by(id: params[:id])
    @place = Place.find_by(:id => @post.place_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.created_at = Time.now
    @post.updated_at = Time.now
   if @post.save
    redirect_to :controller => 'place' , :action => 'index'
   else
      @posts = Post.all
      render :action => 'new'
   end
  end

  def post_params
    params.require(:post).permit(:title, :description, :posted_on, :place_id)
  end
end
