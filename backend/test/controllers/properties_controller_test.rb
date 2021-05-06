require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get properties_url, as: :json
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post properties_url, params: { property: { address: @property.address, latitude: @property.latitude, longitude: @property.longitude beds: @property.beds, description: @property.description, guests: @property.guests, price: @property.price, propType: @property.propType, rooms: @property.rooms, title: @property.title, user_id: @property.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show property" do
    get property_url(@property), as: :json
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: { property: { address: @property.address, beds: @property.beds, description: @property.description, guests: @property.guests, price: @property.price, propType: @property.propType, rooms: @property.rooms, title: @property.title, user_id: @property.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete property_url(@property), as: :json
    end

    assert_response 204
  end
end
