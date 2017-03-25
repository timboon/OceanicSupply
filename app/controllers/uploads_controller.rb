class UploadsController < ApplicationController
  before_action :admins_only, only: [:destroy, :create, :new]
  layout "certs_layout"
    
  def new
    @upload= Upload.new
  end
  
  def create
    
    @upload = Upload.new(upload_params)
    @upload.user_id = params[:upload][:id]
  
    if @upload.save
    flash[:success] = "File Saved!"
    redirect_to certs_path
  else
   render action: :new
  end
  end
  
  
  def destroy

    upload=Upload.find(params[:id])
    upload.destroy
    flash[:success] = "File deleted"
   redirect_back(fallback_location: users_path)
  end
  
  
  
  private
   def upload_params
      params.require(:upload).permit(:user_id, :avatar, :order)
    end
  
    def admins_only
    if !admin_signed_in?
     redirect_to(certs_path)
    end
  end
  
end
