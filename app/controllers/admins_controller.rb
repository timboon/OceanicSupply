class AdminsController < ApplicationController
  before_action :one_login
  layout "certs_layout"
  
  def login
    
  end

private
  def one_login
    if user_signed_in?
     redirect_to(certs_path)
    end
  end

end