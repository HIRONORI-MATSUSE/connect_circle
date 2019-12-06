require 'test_helper'

class ClinicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clinics_index_url
    assert_response :success
  end

end
