class OrganizationsController < ApplicationController
  respond_to :html, :json

  before_action :authorize
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /organizations
  def index
    @organizations = Organization.search query: params[:q], limit: request.xhr?

    respond_with @organizations
  end

  # GET /organizations/1
  def show
    respond_with @organization
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
    respond_with @organization
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  def create
    @organization = Organization.new organization_params

    @organization.save
    respond_with @organization, location: launchpad_url
  end

  # PUT/PATCH /organizations/1
  def update
    update_resource @organization, organization_params
    respond_with @organization, location: launchpad_url
  end

  # DELETE /organizations/1
  def destroy
    @organization.destroy
    respond_with @organization, location: launchpad_url
  end

  private

    def set_organization
      @organization = Organization.find params[:id]
    end

    def organization_params
      params.require(:organization).permit :lock_version, entity_attributes: [
        :id, :tax_id, :tax_condition, :name, :email, :address, :city_id
      ]
    end
end
