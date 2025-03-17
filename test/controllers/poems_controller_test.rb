require "test_helper"

class PoemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # ユーザーの fixture を取得
    @poem = poems(:one) # fixture を使う
  end

  test "should get index" do
    get poems_url
    assert_response :success
  end

  test "should get new" do
    get new_poem_url
    assert_response :success
  end

  test "should create poem" do
    assert_difference("Poem.count") do
      post poems_url, params: { poem: { aroma: @poem.aroma, content: @poem.content, location: @poem.location, title: @poem.title, user_id: @poem.user_id  } }
    end

    assert_redirected_to poem_url(Poem.last)
  end

  test "should show poem" do
    get poem_url(@poem)
    assert_response :success
  end

  test "should get edit" do
    get edit_poem_url(@poem)
    assert_response :success
  end

  test "should update poem" do
    patch poem_url(@poem), params: { poem: { aroma: @poem.aroma, content: @poem.content, location: @poem.location, title: @poem.title, user_id: @poem.user_id  } }
    assert_redirected_to poem_url(@poem)
  end

  test "should destroy poem" do
    assert_difference("Poem.count", -1) do
      delete poem_url(@poem)
    end

    assert_redirected_to poems_url
  end
end
