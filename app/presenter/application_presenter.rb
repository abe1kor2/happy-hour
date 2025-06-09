class ApplicationPresenter < SimpleDelegator
  def initialize(model, view)
		@view = view
		@model = model
		
    super(model)
  end

  def self.presents(name)
    define_method(name) do
      @model
    end
  end
end
