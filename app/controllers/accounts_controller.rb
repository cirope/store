class AccountsController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_account, only:  [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /accounts
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create
    @title = t 'accounts.new.title'
    @account = Account.new account_params

    create_and_respond
  end

  # PUT/PATCH /accounts/1
  def update
    @title = t 'accounts.edit.title'

    update_and_respond
  end

  # DELETE /accounts/1
  def destroy
    destroy_and_respond
  end

  private

  def set_account
    @account = Account.find params[:id]
  end

  def set_title
    @title = t '.title'
  end

  def account_params
    params.require(:account).permit :name, :subdomain, :lock_version
  end
  alias_method :resource_params, :account_params

  def resource
    @account
  end
  alias_method :after_create_url, :resource
  alias_method :after_update_url, :resource

  def edit_resource_url
    edit_account_url @account
  end

  alias_method :after_destroy_url, :accounts_url
end
