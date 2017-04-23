class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :set_garden

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.garden = @garden
    if @post.save
      redirect_to garden_path(@garden)
    else
      redirect_to garden_path(@garden)
      flash[:notice] = "Failed to create post"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to garden_path(@garden)
    else
      redirect_to garden_path(@garden)
      flash[:notice] = "Failed to update post"
    end
  end

  def destroy
    @post.destroy
    redirect_to garden_path(@garden)
    flash[:notice] = "Succesfully destroyed post"
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
