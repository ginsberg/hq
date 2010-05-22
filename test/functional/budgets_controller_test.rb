require 'test_helper'

class BudgetControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Budget.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Budget.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to budgets_url
  end
  
  def test_edit
    get :edit, :id => Budget.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Budget.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Budget.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Budget.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Budget.first
    assert_redirected_to budgets_url
  end
end
