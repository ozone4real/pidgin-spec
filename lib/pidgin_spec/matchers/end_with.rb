module Matchers
  class EndWith < BaseMatcher
    def initialize(expected)
      @expected = expected.length == 1 ? expected.first : expected 
    end

    def matches?(value)
      @value = value
      if @expected.is_a?(String) || @expected.is_a?(Array)
        @value[-@expected.length, @expected.length] == @expected
      else
        @value.last == @expected
      end
      # if value.is_a?(String) && @expected.is_a?(String)
      #   @value[-@expected[0].length, @expected[0].length] == @expected[0]
      # elsif value.is_a? Array
      #   array_len = @expected.length
      #   @value.last(array_len) == @expected
      # end
    end

    def failure_message_when_negated
      "You bin dey expect say #{@value} no go end with #{@expected}, but e con end with am"
    end

    def failure_message
      "You bin dey expect make #{@value} end with #{@expected}, but e no con end with am"
    end
  end
end