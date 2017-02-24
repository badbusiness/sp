require 'test_helper'

class SupplierControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get supplier_new_url
    assert_response :success
  end

  test "should get index" do
    get supplier_index_url
    assert_response :success
  end

end
