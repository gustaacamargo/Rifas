require "test_helper"

class Api::V1::TicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_tickets_index_url
    assert_response :success
  end
end
