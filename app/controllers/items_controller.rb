class ItemsController < ApplicationController
  respond_to :html, :json

  before_action :authorize
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /items
  def index
    @items = Item.search query: params[:q], limit: request.xhr?

    respond_with @items
  end

  # GET /items/1
  def show
    respond_with @item
  end

  # GET /items/new
  def new
    @item = Item.new
    respond_with @item
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new item_params

    @item.save
    respond_with @item
  end

  # PUT/PATCH /items/1
  def update
    update_resource @item, item_params
    respond_with @item
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    respond_with @item
  end

  private

    def set_item
      @item = Item.find params[:id]
    end

    def item_params
      params.require(:item).permit :code, :name, :price, :unit, :lock_version
    end
end
