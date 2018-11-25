require 'test_helper'

class EmergencyContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get emergency_contacts_home_url
    assert_response :success
  end

end
