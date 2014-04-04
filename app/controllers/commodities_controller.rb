class CommoditiesController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_commodity, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /commodities
  def index
    @commodities = Commodity.search query: params[:q], limit: request.xhr?

    respond_with @commodities
  end
end
