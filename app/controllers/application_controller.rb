class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, :only => :create
  skip_before_action :verify_authenticity_token, :only => :destroy

  layout :layout_by_resource

  private
  def layout_by_resource
    if devise_controller? && resource_class == Admin
      "admin_devise"
    else
      "application"
    end
  end
end
