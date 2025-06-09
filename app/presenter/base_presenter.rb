class BasePresenter
  def initialize(model, view)
    @model = model
    @view = view
  end

  def self.presents(name)
    define_method(name) { @model }
  end

  private
  
  def h
    @view
  end
end
