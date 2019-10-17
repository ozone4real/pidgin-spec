class ExampleGroup
  def initialize(des_statement, klass, &block)
    @des_statement = des_statement
    @klass = klass
    instance_eval(&block)
  end
  def e_go(spec_statement, &block)
    Example.new(@des_statement, spec_statement, @klass, &block)
    @spec_statement = spec_statement
  end
  alias_method :e_dey, :e_go
end