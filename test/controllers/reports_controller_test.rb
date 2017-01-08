require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reports_url
    assert_response :success
  end

  test "should get new" do
    get new_report_url
    assert_response :success
  end

  test "should get show" do
    report = reports(:one)
    get report_url(report)
    assert_response :success
  end

  test "should get edit" do
    report = reports(:one)
    get edit_report_url(report)
    assert_response :success
  end
end
