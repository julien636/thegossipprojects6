require 'test_helper'

class GossipControllerTest < ActionDispatch::IntegrationTest
  test "should get gossip_display" do
    get gossip_gossip_display_url
    assert_response :success
  end

end
