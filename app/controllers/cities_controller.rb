class CitiesController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /cities
  def index
    @cities = City.all
  end

  # GET /cities/1
  def show
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  def create
    @title = t 'cities.new.title'
    @city = City.new city_params

    create_and_respond
  end

  # PUT/PATCH /cities/1
  def update
    @title = t 'cities.edit.title'

    update_and_respond
  end

  # DELETE /cities/1
  def destroy
    destroy_and_respond
  end

  private

    def set_city
      @city = City.find params[:id]
    end

    def set_title
      @title = t '.title'
    end

    def city_params
      params.require(:city).permit :name, :zip_code, :state_id, :lock_version
    end
    alias_method :resource_params, :city_params

    def resource
      @city
    end
end
