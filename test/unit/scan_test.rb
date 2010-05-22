require 'test_helper'

class ScanTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Scan.new.valid?
  end
end
