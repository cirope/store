class ItemsController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /items
  def index
    @items = Item.all
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @title = t 'items.new.title'
    @item = Item.new item_params

    create_and_respond
  end

  # PUT/PATCH /items/1
  def update
    @title = t 'items.edit.title'

    update_and_respond
  end

  # DELETE /items/1
  def destroy
    destroy_and_respond
  end

  private

  def set_item
    @item = Item.find params[:id]
  end

  def set_title
    @title = t '.title'
  end

  def item_params
    params.require(:item).permit :code, :name, :price, :unit, :lock_version
  end
  alias_method :resource_params, :item_params

  def resource
    @item
  end
  alias_method :after_create_url, :resource
  alias_method :after_update_url, :resource

  def edit_resource_url
    edit_item_url @item
  end

  alias_method :after_destroy_url, :items_url
end
