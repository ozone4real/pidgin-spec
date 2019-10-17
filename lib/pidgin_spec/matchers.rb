module Matchers
  def be(expected)
    Be.new(expected)
  end 

  def dey_equal_to(expected)
    DeyEqualTo.new(expected)
  end

  def end_with(*expected)
    EndWith.new(expected)
  end
end