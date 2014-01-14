class DashboardController < ApplicationController
  before_action :authorize

  def index
    @title = t '.title'
  end
end
