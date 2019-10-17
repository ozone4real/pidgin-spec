require_relative './matchers'

class Example
  include Matchers
  attr_accessor :passed
  def initialize(des_statement, spec_statement, klass, &block)
    @passed = true
    @spec_statement = spec_statement
    @des_statement = des_statement
    klass.spec_count += 1
    @klass = klass
    @self_klass = self
    instance_eval(&block)
    print '.'.send(@passed ? 'green' : 'red')
  end
  def expect_say(value)
    Expect.new(value, @klass, @self_klass, @spec_statement, @des_statement)
  end
end
