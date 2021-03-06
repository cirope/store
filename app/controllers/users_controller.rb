class UsersController < ApplicationController
  respond_to :html, :json

  before_action :authorize
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /users
  def index
    @users = User.search query: params[:q], limit: request.xhr?
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new user_params

    @user.save
    respond_with @user
  end

  # PATCH/PUT /users/1
  def update
    update_resource @user, user_params
    respond_with @user
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_with @user
  end

  private

    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(
        :name, :lastname, :email, :password, :password_confirmation, :lock_version,
        relations_attributes: [:id, :organization_id, :_destroy]
      )
    end
end
