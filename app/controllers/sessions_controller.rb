class SessionsController < ApplicationController
  def new
    redirect_to default_url if current_user

    @title = t '.title'
  end

  def create
    @title = t 'sessions.new.title'
    user = scope.find_by email: params[:email]

    if user && user.authenticate(params[:password])
      store_auth_token user
      redirect_to default_url, notice: t('.logged_in')
    else
      flash.now.alert = t '.invalid'
      render 'new'
    end
  end

  def destroy
    cookies.delete :auth_token, domain: COOKIES_DOMAIN
    redirect_to root_url, notice: t('.logged_out')
  end

  private

  def scope
    current_organization ? User.current : User.all
  end

  def default_url
    use_launchpad? ? launchpad_url : dashboard_url
  end

  def use_launchpad?
    current_organization.blank? && current_user.organizations.count > 1
  end

  def store_auth_token user
    cookie = { value: user.auth_token, domain: COOKIES_DOMAIN }

    if params[:remember_me]
      cookies.permanent.encrypted[:auth_token] = cookie
    else
      cookies.encrypted[:auth_token] = cookie
    end
  end
end
