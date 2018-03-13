# file: app/controllers/api/v1/feedbacks_controller.rb
class FeedbacksController < ApplicationController

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json

  #before_action :authenticate_user!

  def index
    @feedbacks = Feedback.all
    render json: @feedbacks
  end

  def create
    @feedback = current_user.feedbacks.build(params[:feedback])
    if @feedback.save
      @feedback
    else
      render :status => :unprocessable_entity,
        :json => { :success => false,
                   :info => @feedback.errors.full_messages,
                   :data => {} }
    end
  end

  def open
    @feedback = current_user.feedbacks.find(params[:id])
    @feedback.open!
  rescue ActiveRecord::RecordNotFound
    render :status => 404,
      :json => { :success => false,
                 :info => 'Not Found',
                 :data => {} }
  end

  def complete
    @feedback = current_user.feedbacks.find(params[:id])
    @feedback.complete!
  rescue ActiveRecord::RecordNotFound
    render :status => 404,
      :json => { :success => false,
                 :info => 'Not Found',
                 :data => {} }
  end

end

