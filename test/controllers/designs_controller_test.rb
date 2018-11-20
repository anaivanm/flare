require 'test_helper'

class DesignsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get designs_index_url
    assert_response :success
  end

end
