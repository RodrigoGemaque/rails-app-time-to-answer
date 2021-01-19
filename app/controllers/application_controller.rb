class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, :only => :create
  skip_before_action :verify_authenticity_token, :only => :destroy

  layout :layout_by_resource

  protected
  def layout_by_resource
    #condicional ternaria  
     devise_controller? ? "#{resource_class.to_s.downcase}_devise" : "application"
    
  end
end
