require 'test_helper'

class DebtTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Debt.new.valid?
  end
end
