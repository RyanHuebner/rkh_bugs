require 'test_helper'

class BugsControllerTest < ActionController::TestCase
  setup do
    @bug = bugs(:one)
    @user= User.create(last_name: "last", first_name: "first", email: "rails@mail.com",
      thumbnail: "me.png")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bugs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bug" do
    assert_difference('Bug.count') do
      post :create, bug: { description: @bug.description, issue_type: @bug.issue_type, priority: @bug.priority, status: @bug.status, title: @bug.title }
    end

    assert_redirected_to bug_path(assigns(:bug))
  end

  test "should show bug" do
    get :show, id: @bug
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bug
    assert_response :success
  end

  test "should update bug" do
    patch :update, id: @bug, bug: { description: @bug.description, issue_type: @bug.issue_type, priority: @bug.priority, status: @bug.status, title: @bug.title, user_id: @user.user_id }
    assert_redirected_to bug_path(assigns(:bug))
  end

  test "should destroy bug" do
    assert_difference('Bug.count', -1) do
      delete :destroy, id: @bug
    end

    assert_redirected_to bugs_path
  end
end
