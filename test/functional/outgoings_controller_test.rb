require 'test_helper'

class OutgoingsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Outgoing.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Outgoing.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to outgoings_url
  end
  
  def test_edit
    get :edit, :id => Outgoing.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Outgoing.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Outgoing.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Outgoing.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Outgoing.first
    assert_redirected_to outgoings_url
  end
end
