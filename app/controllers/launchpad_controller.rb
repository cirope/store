class LaunchpadController < ApplicationController
  before_action :authorize, :set_title

  def index
    @organizations = Organization.all
  end
end
