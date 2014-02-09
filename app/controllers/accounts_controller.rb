class AccountsController < ApplicationController
  respond_to :html, :json

  before_action :authorize
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /accounts
  def index
    @accounts = Account.all

    respond_with @accounts
  end

  # GET /accounts/1
  def show
    respond_with @account
  end

  # GET /accounts/new
  def new
    @account = Account.new
    respond_with @account
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create
    @title = t 'accounts.new.title'
    @account = Account.new account_params

    @account.save
    respond_with @account
  end

  # PUT/PATCH /accounts/1
  def update
    @title = t 'accounts.edit.title'

    @account.update account_params
    respond_with @account
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    respond_with @account
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
end
