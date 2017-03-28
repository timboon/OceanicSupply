class UsersController < ApplicationController
  before_action :admins_only, only: [:new, :create, :index, :edit, :update, :destroy]
  before_action :only_current_user, only: [:show]
  layout "certs_layout"
  
  def new 
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
    flash[:success] = "User Saved!"
    redirect_to certs_path
  else
   render action: :new
  end
end

  def index
   @users=User.includes(:uploads)
  end
  

  def show
    users=User.includes(:uploads)
     @user = users.find(params[:id])
      
  end


  def edit
    @user = User.find( params[:id])
  end
  
  def update

    @user = User.find(params[:id])

    # mass assign edited profile attributes and save
    if @user.update_attributes(user_params)
      flash[:success] = "Profile has been updated!"

      redirect_to user_path(id: params[:id])
    else
      redirect_back(fallback_location: users_path)
      flash[:error] = "Profile update failed - please ensure all fields are filled"
    end
  end
  
  
  def destroy
    user=User.find(params[:id])
    user.destroy
    flash[:success] = "User deleted"
   redirect_back(fallback_location: users_path)
  end
  
  
  private

    def user_params
      params.require(:user).permit(:name,:email, :password, :password_confirmation)
    end

  def admins_only
    if !admin_signed_in?
     redirect_to(certs_path)
    end
  end
  
      def only_current_user
      @user= User.find(params[:id])
      redirect_to(certs_path) unless @user == current_user || admin_signed_in?
    end
  

end
