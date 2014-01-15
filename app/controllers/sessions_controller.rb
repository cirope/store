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
    redirect_to root_url(subdomain: 'www'), notice: t('.logged_out')
  end

  private

  def scope
    current_account ? User : User.unscoped
  end

  def default_url
    launchpad_url subdomain: current_user.account_subdomain
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
