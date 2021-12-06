require "test_helper"

class AwaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @away = aways(:one)
  end

  test "should get index" do
    get aways_url
    assert_response :success
  end

  test "should get new" do
    get new_away_url
    assert_response :success
  end

  test "should create away" do
    assert_difference('Away.count') do
      post aways_url, params: { away: { away_team: @away.away_team, home_team: @away.home_team, match_date: @away.match_date, result: @away.result, tour: @away.tour, tournament_id: @away.tournament_id } }
    end

    assert_redirected_to away_url(Away.last)
  end

  test "should show away" do
    get away_url(@away)
    assert_response :success
  end

  test "should get edit" do
    get edit_away_url(@away)
    assert_response :success
  end

  test "should update away" do
    patch away_url(@away), params: { away: { away_team: @away.away_team, home_team: @away.home_team, match_date: @away.match_date, result: @away.result, tour: @away.tour, tournament_id: @away.tournament_id } }
    assert_redirected_to away_url(@away)
  end

  test "should destroy away" do
    assert_difference('Away.count', -1) do
      delete away_url(@away)
    end

    assert_redirected_to aways_url
  end
end
