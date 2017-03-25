class PagesController < ApplicationController
  def home
    render :layout => "home_layout"
  end
  
  def certs
      render :layout => "certs_layout"
  end
  
  def contact
    render :layout => "home_layout"
  end

end
