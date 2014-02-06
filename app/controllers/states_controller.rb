class StatesController < ApplicationController
  include Responder

  before_action :authorize
  before_action :set_state, only: [:show, :edit, :update, :destroy]
  before_action :set_title, only: [:index, :show, :new, :edit]

  # GET /states
  def index
    @states = State.all
  end

  # GET /states/1
  def show
  end

  # GET /states/new
  def new
    @state = State.new
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states
  def create
    @title = t 'states.new.title'
    @state = State.new state_params

    create_and_respond
  end

  # PUT/PATCH /states/1
  def update
    @title = t 'states.edit.title'

    update_and_respond
  end

  # DELETE /states/1
  def destroy
    destroy_and_respond
  end

  private

    def set_state
      @state = State.find params[:id]
    end

    def set_title
      @title = t '.title'
    end

    def state_params
      params.require(:state).permit :name, :lock_version
    end
    alias_method :resource_params, :state_params

    def resource
      @state
    end
end
