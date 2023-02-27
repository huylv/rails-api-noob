class Api::Latest::ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :set_image, only: %i[ show update destroy ]
  before_action :authenticate_devise_api_token!, only: %i[ destroy ]

  # GET /images
  def index
    @images = Image.all

    render json: @images
  end

  # GET /images/1
  def show
    render json: @image
  end

  # POST /images
  def create
    @image = Image.new(image_params)

    if @image.save
      render json: @image, status: :created, location: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    devise_api_token = current_devise_api_token
    if devise_api_token
      @image.destroy
      render json: { message: "Logged in as #{devise_api_token}. Image deleted" }, status: :ok
    else
      render json: { message: "You need to log in" }, status: :unauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def image_params
    params.require(:image).permit(image_file: :data)
  end
end
