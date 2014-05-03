class ServicesController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /services
  def index
    @services = Service.all
    respond_with @services
  end

  # GET /services/1
  def show
    respond_with @service
  end

  # GET /services/new
  def new
    @service = Service.new
    respond_with @service
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  def create
    @service = Service.new service_params

    @service.save
    respond_with @service
  end

  # PATCH/PUT /services/1
  def update
    update_resource @service, service_params
    respond_with @service
  end

  # DELETE /services/1
  def destroy
    @service.destroy
    respond_with @service
  end

  private

    def set_service
      @service = Service.find params[:id]
    end

    def service_params
      params.require(:service).permit commodity_attributes: [
        :id, :name, :price, :lock_version
      ]
    end
end
