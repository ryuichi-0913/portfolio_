require 'test_helper'

class Users::NonfoodsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get users_nonfoods_new_url
    assert_response :success
  end

  test 'should get index' do
    get users_nonfoods_index_url
    assert_response :success
  end

  test 'should get show' do
    get users_nonfoods_show_url
    assert_response :success
  end

  test 'should get edit' do
    get users_nonfoods_edit_url
    assert_response :success
  end
end
