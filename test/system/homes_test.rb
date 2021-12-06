require "application_system_test_case"

class HomesTest < ApplicationSystemTestCase
  setup do
    @home = homes(:one)
  end

  test "visiting the index" do
    visit homes_url
    assert_selector "h1", text: "Homes"
  end

  test "creating a Home" do
    visit homes_url
    click_on "New Home"

    fill_in "Away team", with: @home.away_team
    fill_in "Home team", with: @home.home_team
    fill_in "Match date", with: @home.match_date
    fill_in "Result", with: @home.result
    fill_in "Tour", with: @home.tour
    click_on "Create Home"

    assert_text "Home was successfully created"
    click_on "Back"
  end

  test "updating a Home" do
    visit homes_url
    click_on "Edit", match: :first

    fill_in "Away team", with: @home.away_team
    fill_in "Home team", with: @home.home_team
    fill_in "Match date", with: @home.match_date
    fill_in "Result", with: @home.result
    fill_in "Tour", with: @home.tour
    click_on "Update Home"

    assert_text "Home was successfully updated"
    click_on "Back"
  end

  test "destroying a Home" do
    visit homes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Home was successfully destroyed"
  end
end
