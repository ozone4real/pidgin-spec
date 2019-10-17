class Expect
  class NoMatcherError < StandardError
  end

  def initialize(value, klass, self_klass, spec_statement, des_statement)
    @klass = klass
    @value = value
    @des_statement = des_statement
    @spec_statement = spec_statement
    @self_klass = self_klass
  end

  def go(matcher)
    
    if matcher.matches?(@value)
      @klass.pass_count += 1
    else
      @klass.fail_count += 1
      @klass.failure_messages << {
        description: "#{@des_statement} #{@spec_statement}",
         message: matcher.failure_message,
         failed_code: failed_code(caller_locations[0]),
         failed_code_path: "#{caller_locations[0].path.to_s}:#{caller_locations[0].lineno.to_s}"
        }
      @self_klass.passed = false
    end
  end

  def no_go(matcher)
    if !matcher.matches?(@value)
      @klass.pass_count += 1
    else
      @klass.fail_count += 1
      @klass.failure_messages << {
        description: "#{@des_statement} #{@spec_statement}",
         message: matcher.failure_message_when_negated,
         failed_code: failed_code(caller_locations[0]),
         failed_code_path: "#{caller_locations[0].path.to_s}:#{caller_locations[0].lineno.to_s}"
        }
      @self_klass.passed = false
    end
  end

  private
  def failed_code(caller_trace)
    File.readlines(caller_trace.absolute_path)[caller_trace.lineno - 1].strip
  end
end