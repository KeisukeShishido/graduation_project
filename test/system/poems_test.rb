require "application_system_test_case"

class PoemsTest < ApplicationSystemTestCase
  setup do
    @poem = poems(:one)
  end

  test "visiting the index" do
    visit poems_url
    assert_selector "h1", text: "Poems"
  end

  test "should create poem" do
    visit poems_url
    click_on "New poem"

    fill_in "Aroma", with: @poem.aroma
    fill_in "Content", with: @poem.content
    fill_in "Location", with: @poem.location
    fill_in "Title", with: @poem.title
    fill_in "User", with: @poem.user_id
    click_on "Create Poem"

    assert_text "Poem was successfully created"
    click_on "Back"
  end

  test "should update Poem" do
    visit poem_url(@poem)
    click_on "Edit this poem", match: :first

    fill_in "Aroma", with: @poem.aroma
    fill_in "Content", with: @poem.content
    fill_in "Location", with: @poem.location
    fill_in "Title", with: @poem.title
    fill_in "User", with: @poem.user_id
    click_on "Update Poem"

    assert_text "Poem was successfully updated"
    click_on "Back"
  end

  test "should destroy Poem" do
    visit poem_url(@poem)
    click_on "Destroy this poem", match: :first

    assert_text "Poem was successfully destroyed"
  end
end
