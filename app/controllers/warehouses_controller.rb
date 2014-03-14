class WarehousesController < ApplicationController
  respond_to :html, :json

  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /warehouses
  def index
    @warehouses = Warehouse.all
    respond_with @warehouses
  end

  # GET /warehouses/1
  def show
    respond_with @warehouse
  end

  # GET /warehouses/new
  def new
    @warehouse = Warehouse.new
    respond_with @warehouse
  end

  # GET /warehouses/1/edit
  def edit
  end

  # POST /warehouses
  def create
    @warehouse = Warehouse.new warehouse_params

    @warehouse.save
    respond_with @warehouse
  end

  # PATCH/PUT /warehouses/1
  def update
    update_resource @warehouse, warehouse_params
    respond_with @warehouse
  end

  # DELETE /warehouses/1
  def destroy
    @warehouse.destroy
    respond_with @warehouse
  end

  private

    def set_warehouse
      @warehouse = Warehouse.find params[:id]
    end

    def warehouse_params
      params.require(:warehouse).permit :name, :lock_version, supplies_attributes: [
        :id, :item_id, :quantity, :_destroy
      ]
    end
end
