class OrganizationsController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_organization, only:  [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /organizations
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  def create
    @title = t 'organizations.new.title'
    @organization = Organization.new organization_params

    create_and_respond
  end

  # PUT/PATCH /organizations/1
  def update
    @title = t 'organizations.edit.title'

    update_and_respond
  end

  # DELETE /organizations/1
  def destroy
    destroy_and_respond
  end

  private

  def set_organization
    @organization = Organization.find params[:id]
  end

  def set_title
    @title = t '.title'
  end

  def organization_params
    params.require(:organization).permit(:name, :subdomain)
  end
  alias_method :resource_params, :organization_params

  def resource
    @organization
  end
  alias_method :after_create_url, :resource
  alias_method :after_update_url, :resource

  def edit_resource_url
    edit_organization_url @organization
  end

  alias_method :after_destroy_url, :organizations_url
end
