class Admin::ImagesController < Admin::BaseController
  before_action :load_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Image was successfully saved!"
      redirect_to admin_image_path(@image)
    else
      flash[:error] = "Please fill in a image title."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @image.update(image_params)
      redirect_to admin_image_path
    else
      render :edit
    end
  end

  def destroy
    @image.delete
    redirect_to admin_images_path
  end


  private

  def image_params
    params.require(:image).permit(:title, :url)
  end

  def load_image
    @image = Image.find(params[:id])
  end
end
