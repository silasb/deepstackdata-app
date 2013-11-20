class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_filter :scope_current_tenant
  before_filter :authenticate_user!

  def cp
    if current_user.nil?
      redirect_to new_user_session_path
    else
      render :file => 'public/app.html'
    end
  end

  def after_sign_in_path_for(resource)
    root_path
  end

private

  def current_tenant
    Tenant.find_by! subdomain: request.subdomain
  end
  helper_method :current_tenant

  def scope_current_tenant
    Tenant.current_id = current_tenant.id
    yield
  ensure
    Tenant.current_id = nil
  end
end
