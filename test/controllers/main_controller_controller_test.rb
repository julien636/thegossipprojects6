require 'test_helper'

class MainControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get team" do
    get main_controller_team_url
    assert_response :success
  end

  test "should get contact" do
    get main_controller_contact_url
    assert_response :success
  end

end
