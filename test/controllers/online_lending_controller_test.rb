require 'test_helper'

class OnlineLendingControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get online_lending_register_url
    assert_response :success
  end

  test "should get login" do
    get online_lending_login_url
    assert_response :success
  end

  test "should get borrower" do
    get online_lending_borrower_url
    assert_response :success
  end

  test "should get lender" do
    get online_lending_lender_url
    assert_response :success
  end

end
