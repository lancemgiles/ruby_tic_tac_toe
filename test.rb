module Testable
  def test
    @thing[:has] = 1
  end

end

class Thing
  include Testable
  def initialize
    @thing = {has: 0}
  end
end

thing = Thing.new()
p thing.test