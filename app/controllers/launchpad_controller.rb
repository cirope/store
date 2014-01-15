class LaunchpadController < ApplicationController
  before_action :authorize

  def index
    @title = t '.title'
    @accounts = current_user.accounts
  end
end
