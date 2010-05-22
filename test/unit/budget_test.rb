require 'test_helper'

class BudgetTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Budget.new.valid?
  end
end
