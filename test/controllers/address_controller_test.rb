require 'test_helper'

class AddressControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get address_show_url
    assert_response :success
  end

end
