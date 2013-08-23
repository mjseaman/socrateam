require 'test_helper'

class BootsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Boot.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Boot.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Boot.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to boot_url(assigns(:boot))
  end

  def test_edit
    get :edit, :id => Boot.first
    assert_template 'edit'
  end

  def test_update_invalid
    Boot.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Boot.first
    assert_template 'edit'
  end

  def test_update_valid
    Boot.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Boot.first
    assert_redirected_to boot_url(assigns(:boot))
  end

  def test_destroy
    boot = Boot.first
    delete :destroy, :id => boot
    assert_redirected_to boots_url
    assert !Boot.exists?(boot.id)
  end
end
