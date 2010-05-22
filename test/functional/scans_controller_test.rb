require 'test_helper'

class ScansControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Scan.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Scan.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Scan.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to scan_url(assigns(:scan))
  end
  
  def test_edit
    get :edit, :id => Scan.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Scan.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Scan.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Scan.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Scan.first
    assert_redirected_to scan_url(assigns(:scan))
  end
  
  def test_destroy
    scan = Scan.first
    delete :destroy, :id => scan
    assert_redirected_to scans_url
    assert !Scan.exists?(scan.id)
  end
end
