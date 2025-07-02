class ApplicationController < ActionController::Base
  # Helper method to instantiate presenters in views and controllers
  helper_method :present
  helper_method :admin_signed_in?

  def present(model, presenter_class = nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, view_context)
    yield presenter if block_given?
    presenter
  end

  private

  def admin_signed_in?
    session[:admin_id] == true
  end

  def require_admin
    unless admin_signed_in?
      redirect_to login_path, alert: "You must be an admin to perform that action."
    end
  end
end
