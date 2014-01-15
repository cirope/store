class LaunchpadController < ApplicationController
  before_action :authorize

  def index
    @title = t '.title'
    @organizations = current_user.organizations
  end
end
