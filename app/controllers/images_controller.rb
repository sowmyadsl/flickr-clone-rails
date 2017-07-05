class ImagesController < ApplicationController
  before_action :authorize, only: [:secret]

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
    flash[:notice] = "Image successfully added!"
      redirect_to  user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "Image successfully updated!"
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      flash[:notice] = "Image successfully removed!"
      redirect_to user_path(current_user.id)
    end
  end

  def secret
  end

private
  def image_params
    # Use strict parameters, replace placeholder info below with your class' actual attributes
    params.require(:image).permit(:title, :avatar, :description, :user_id)
  end
end
