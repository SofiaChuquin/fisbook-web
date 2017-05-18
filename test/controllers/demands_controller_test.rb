require 'test_helper'

class DemandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @demand = demands(:one)
  end

  test "should get index" do
    get demands_url
    assert_response :success
  end

  test "should get new" do
    get new_demand_url
    assert_response :success
  end

  test "should create demand" do
    assert_difference('Demand.count') do
      post demands_url, params: { demand: { body: @demand.body, image: @demand.image, subject: @demand.subject } }
    end

    assert_redirected_to demand_url(Demand.last)
  end

  test "should show demand" do
    get demand_url(@demand)
    assert_response :success
  end

  test "should get edit" do
    get edit_demand_url(@demand)
    assert_response :success
  end

  test "should update demand" do
    patch demand_url(@demand), params: { demand: { body: @demand.body, image: @demand.image, subject: @demand.subject } }
    assert_redirected_to demand_url(@demand)
  end

  test "should destroy demand" do
    assert_difference('Demand.count', -1) do
      delete demand_url(@demand)
    end

    assert_redirected_to demands_url
  end
end
