require "application_system_test_case"

class AwaysTest < ApplicationSystemTestCase
  setup do
    @away = aways(:one)
  end

  test "visiting the index" do
    visit aways_url
    assert_selector "h1", text: "Aways"
  end

  test "creating a Away" do
    visit aways_url
    click_on "New Away"

    fill_in "Away team", with: @away.away_team
    fill_in "Home team", with: @away.home_team
    fill_in "Match date", with: @away.match_date
    fill_in "Result", with: @away.result
    fill_in "Tour", with: @away.tour
    fill_in "Tournament", with: @away.tournament_id
    click_on "Create Away"

    assert_text "Away was successfully created"
    click_on "Back"
  end

  test "updating a Away" do
    visit aways_url
    click_on "Edit", match: :first

    fill_in "Away team", with: @away.away_team
    fill_in "Home team", with: @away.home_team
    fill_in "Match date", with: @away.match_date
    fill_in "Result", with: @away.result
    fill_in "Tour", with: @away.tour
    fill_in "Tournament", with: @away.tournament_id
    click_on "Update Away"

    assert_text "Away was successfully updated"
    click_on "Back"
  end

  test "destroying a Away" do
    visit aways_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Away was successfully destroyed"
  end
end
