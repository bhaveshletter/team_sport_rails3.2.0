class ApplicationController < ActionController::Base
  protect_from_forgery


  rescue_from ActiveRecord::RecordNotFound do
    render_404
  end

  def render_404
    respond_to do |format|
      format.html { render :template => "home/not_found", :layout => "application", :status => "404 Not Found" }
      format.json { render :json => "Recod not found", :layout => "application", :status => "404 Not Found" }
      format.all  { render :nothing  => true, :status => "404 Not Found" }
    end
  end

end
