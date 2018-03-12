class SessionsController < Devise::SessionsController

 # skip_before_action :verify_authenticity_token, raise: false
 skip_before_action :verify_signed_out_user

  # GET /users
  def index
    @users = User.order('created_at DESC')

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.find_by(email: params[:user][:email])
    render :status => 200,
      :json => { :success => true,
                 :info => "Logged in",
                 :data => { :auth_token => @user.authentication_token } }
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
   # @user = User.find_by(email: params[:user][:email])
    @user = User.find_by(authentication_token: params[:auth_token])
    @user.authentication_token = nil
    render :status => 200,
      :json => { :success => true,
                 :info => "Logged out",
                 :data => {} }
  end 

  def failure
    render :status => 401,
      :json => { :success => false,
                 :info => "Login Failed",
                 :data => {} }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation )
  end
end
