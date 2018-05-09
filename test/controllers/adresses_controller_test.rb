require 'test_helper'

class AdressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adress = adresses(:one)
  end

  test "should get index" do
    get addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_address_url
    assert_response :success
  end

  test "should create adress" do
    assert_difference('Address.count') do
      post addresses_url, params: {adress: {city: @adress.city, contact_id: @adress.contact_id, state: @adress.state, street: @adress.street } }
    end

    assert_redirected_to address_url(Address.last)
  end

  test "should show adress" do
    get address_url(@adress)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_url(@adress)
    assert_response :success
  end

  test "should update adress" do
    patch address_url(@adress), params: {adress: {city: @adress.city, contact_id: @adress.contact_id, state: @adress.state, street: @adress.street } }
    assert_redirected_to address_url(@adress)
  end

  test "should destroy adress" do
    assert_difference('Address.count', -1) do
      delete address_url(@adress)
    end

    assert_redirected_to addresses_url
  end
end
