module Matchers
  class DeyEqualTo < BaseMatcher

    def matches?(value)
      @value = value
      @expected == value
    end

    def failure_message_when_negated
      "You bin dey expect say #{@value} no go equal #{@expected}, but e con equal"
    end

    def failure_message
      "You bin dey expect #{@expected} but na #{@value} dey hia o"
    end
  end
end