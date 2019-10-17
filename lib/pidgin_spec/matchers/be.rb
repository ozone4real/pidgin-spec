module Matchers
  class Be < BaseMatcher
    def matches?(value)
      @value = value
      @value.is_a? @expected
    end

    def failure_message_when_negated
      "I bin dey expect say #{@value} no go be #{@expected}, but e con be #{@expected}"
    end

    def failure_message
      "I bin dey expect #{value} go be #{@expected} but e no be am at all"
    end
  end
end