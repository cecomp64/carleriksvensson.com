class GalleryItemsController < ApplicationController
  before_action :set_gallery_item, only: [:show, :edit, :update, :destroy]

  # GET /gallery_items
  # GET /gallery_items.json
  def index
    @gallery_items = GalleryItem.all
  end

  # GET /gallery_items/1
  # GET /gallery_items/1.json
  def show
  end

  # GET /gallery_items/new
  def new
    @gallery_item = GalleryItem.new
  end

  # GET /gallery_items/1/edit
  def edit
  end

  # POST /gallery_items
  # POST /gallery_items.json
  def create
    @gallery_item = GalleryItem.new(gallery_item_params)

    respond_to do |format|
      if @gallery_item.save
        format.html { redirect_to request.referrer, notice: 'Gallery item was successfully created.' }
        format.json { render :show, status: :created, location: @gallery_item }
      else
        format.html { render :new }
        format.json { render json: @gallery_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gallery_items/1
  # PATCH/PUT /gallery_items/1.json
  def update
    respond_to do |format|
      if @gallery_item.update(gallery_item_params)
        format.html { redirect_to request.referrer, notice: 'Gallery item was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery_item }
      else
        format.html { render :edit }
        format.json { render json: @gallery_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gallery_items/1
  # DELETE /gallery_items/1.json
  def destroy
    @gallery_item.destroy
    respond_to do |format|
      format.html { redirect_to gallery_items_url, notice: 'Gallery item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery_item
      @gallery_item = GalleryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_item_params
      params.require(:gallery_item).permit(:title, :description, :gallery_id, :cover, :image)
    end
end
