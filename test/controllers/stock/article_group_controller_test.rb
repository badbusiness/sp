require 'test_helper'

class Stock::ArticleGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stock_article_group_index_url
    assert_response :success
  end

  test "should get new" do
    get stock_article_group_new_url
    assert_response :success
  end

  test "should get create" do
    get stock_article_group_create_url
    assert_response :success
  end

end
