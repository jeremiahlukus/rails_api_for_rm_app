class RegistrationsController < Devise::RegistrationsController
  before_action :sign_up_params

  respond_to :json 
  def create
    @user = make_new
    @user.skip_confirmation!
    if @user.save
      sign_in(@user, store: false)
      render :status => 200,
        :json => { :success => true,
                   :info => "Registered",
                   :data => { :user => @user,
                              :auth_token => current_user.authentication_token } }
    else
      render :status => :unprocessable_entity,
        :json => { :success => false,
                   :info => resource.errors,
                   :data => {} }
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def make_new
   @user = User.new(email: params[:user][:email], name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation]) 
  end

end
