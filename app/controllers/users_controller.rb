class UsersController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /users
  def index
    @users = scope
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = scope.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @title = t 'users.new.title'
    @user = scope.new create_user_params

    create_and_respond
  end

  # PATCH/PUT /users/1
  def update
    @title = t 'users.edit.title'

    update_and_respond
  end

  # DELETE /users/1
  def destroy
    destroy_and_respond
  end

  private

  def scope
    current_account ? User.current : User.all
  end

  def set_user
    @user = scope.find params[:id]
  end

  def set_title
    @title = t '.title'
  end

  def user_params
    params.require(:user).permit(
      :name, :lastname, :email, :password, :password_confirmation, :lock_version,
      relations_attributes: [:id, :account_id, :_destroy]
    )
  end
  alias_method :resource_params, :user_params

  def create_user_params
    if current_account
      user_params.merge relations_attributes: [ account_id: current_account.id ]
    else
      user_params
    end
  end

  def resource
    @user
  end

  alias_method :after_create_url, :resource
  alias_method :after_update_url, :resource

  def edit_resource_url
    edit_user_url @user
  end

  def after_destroy_url; users_url; end
end
