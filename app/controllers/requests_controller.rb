class RequestsController < ApplicationController

 # before_action :authenticate_user!
  respond_to :json 

  def create
    @request = make_new
    if @request.save 
      render :status => 200,
        :json => { :success => true,
                   :info => "Registered",
                   :data => {} }
    else
      render :status => :unprocessable_entity,
        :json => { :success => false,
                   :info => @user.errors,
                   :data => {} }
    end
 
  end


  private
  def sign_up_params
    params.require(:request).permit(:subject, :detail, :user_id)
  end

  def make_new
    @request = Request.new(subject: params[:subject], detail: params[:details], user_id: 1)
  end


end
