require 'test_helper'

class Example::ResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @example_resource = example_resources(:one)
  end

  test "should get index" do
    get example_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_example_resource_url
    assert_response :success
  end

  test "should create example_resource" do
    assert_difference('Example::Resource.count') do
      post example_resources_url, params: { example_resource: { name: @example_resource.name } }
    end

    assert_redirected_to example_resource_url(Example::Resource.last)
  end

  test "should show example_resource" do
    get example_resource_url(@example_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_example_resource_url(@example_resource)
    assert_response :success
  end

  test "should update example_resource" do
    patch example_resource_url(@example_resource), params: { example_resource: { name: @example_resource.name } }
    assert_redirected_to example_resource_url(@example_resource)
  end

  test "should destroy example_resource" do
    assert_difference('Example::Resource.count', -1) do
      delete example_resource_url(@example_resource)
    end

    assert_redirected_to example_resources_url
  end
end
