require 'test_helper'

class OutgoingTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Outgoing.new.valid?
  end
end
