class ProvidersController < ApplicationController
  respond_to :html, :json

  before_action :authorize
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /providers
  def index
    @providers = Provider.search query: params[:q], limit: request.xhr?

    respond_with @providers
  end

  # GET /providers/1
  def show
    respond_with @provider
  end

  # GET /providers/new
  def new
    @provider = Provider.new
    respond_with @provider
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  def create
    @provider = Provider.new provider_params

    @provider.save
    respond_with @provider
  end

  # PATCH/PUT /providers/1
  def update
    update_resource @provider, provider_params
    respond_with @provider
  end

  # DELETE /providers/1
  def destroy
    @provider.destroy
    respond_with @provider
  end

  private

    def set_provider
      @provider = Provider.find params[:id]
    end

    def provider_params
      params.require(:provider).permit :lock_version, entity_attributes: [
        :id, :tax_id, :tax_condition, :name, :email, :address, :city_id
      ]
    end
end
