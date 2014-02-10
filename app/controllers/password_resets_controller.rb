class PasswordResetsController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
    @title = t '.title'
  end

  def create
    @title = t 'password_resets.new.title'
    user = scope.find_by email: params[:email]

    if user
      user.prepare_password_reset
      UserMailer.password_reset(user).deliver

      redirect_to root_url, notice: t('.success')
    else
      flash.now[:alert] = t '.not_found'
      render 'new'
    end
  end

  def edit
    @title = t '.title'
  end

  def update
    @title = t 'password_resets.edit.title'

    if @user.password_expired?
      redirect_to new_password_reset_path, alert: t('.expired')
    elsif @user.update(user_params)
      redirect_to root_url, notice: t('.success')
    else
      render 'edit'
    end
  end

  private

    def scope
      User.unscoped
    end

    def set_user
      @user = scope.find_by! password_reset_token: params[:id]
    end

    def user_params
      params.require(:user).permit :password, :password_confirmation
    end
end
