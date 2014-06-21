class FeedbacksController < ApplicationController
  respond_to :html, :json

  before_action :authorize, only: [:index, :show]
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  before_action :set_title

  # GET /feedbacks
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1
  def show
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # PATCH/PUT /feedbacks/1
  def update
    update_resource @feedback, feedback_params
    respond_with @feedback, location: edit_feedback_url(@feedback)
  end

  private

    def set_feedback
      @feedback = Feedback.from_token params[:id]
    end

    def feedback_params
      params.require(:feedback).permit :score, :notes
    end
end
