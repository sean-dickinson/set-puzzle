require "test_helper"

class AuthenticationTest < ActionDispatch::IntegrationTest
  test "should login a user with valid credentials" do
    user = User.create!(
      username: "testuser",
      email_address: "test@example.com",
      password: "securepassword"
    )
    assert_difference -> { Session.count }, 1 do
      post session_path, params: { email_address: user.email_address, password: "securepassword" }
    end

    assert_redirected_to root_path
  end

  test "should not login a user with invalid credentials" do
    user = User.create!(
      username: "testuser",
      email_address: "test@example.com",
      password: "securepassword"
    )

    assert_no_difference -> { Session.count } do
      post session_path, params: { email_address: user.email_address, password: "invalidpassword" }
    end

    assert_redirected_to new_session_path
  end

  test "should logout a logged-in user" do
    user = User.create!(
    username: "testuser",
    email_address: "test@example.com",
    password: "securepassword"
    )
    post session_path, params: { email_address: user.email_address, password: "securepassword" }

    assert_difference -> { Session.count }, -1 do
      delete session_path
    end

    assert_redirected_to new_session_path
  end
end
