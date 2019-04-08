class Base
  attr_reader :errors

  def initialize(*args)
    @errors = []
    super
  end

  def success?
    errors.empty?
  end
end
