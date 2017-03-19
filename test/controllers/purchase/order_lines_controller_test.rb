require 'test_helper'

class Purchase::OrderLinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchase_order_lines_index_url
    assert_response :success
  end

  test "should get show" do
    get purchase_order_lines_show_url
    assert_response :success
  end

end
