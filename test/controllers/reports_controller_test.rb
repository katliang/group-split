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

  test "should destroy report" do
    report = reports(:one)
    assert_difference('Report.count', -1) do
      delete report_url(report)
    end

    assert_redirected_to reports_path
  end
end
