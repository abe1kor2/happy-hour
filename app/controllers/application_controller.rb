class ApplicationController < ActionController::Base
  # Helper method to instantiate presenters in views and controllers
  helper_method :present

  def present(model, presenter_class = nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, view_context)
    yield presenter if block_given?
    presenter
  end
end
