class LaunchpadController < ApplicationController
  before_action :authorize

  def index
    @title = t '.title'
    @organizations = Organization.all
  end
end
