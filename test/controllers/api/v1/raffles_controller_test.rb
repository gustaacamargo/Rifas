require "test_helper"

class Api::V1::RafflesControllerTest < ActionDispatch::IntegrationTest
  test "should get raffle" do
    get api_v1_raffles_raffle_url
    assert_response :success
  end
end
