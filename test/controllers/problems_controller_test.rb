require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase
  setup do
    @problem = problems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problem" do
    assert_difference('Problem.count') do
      post :create, problem: { body: @problem.body, location: @problem.location, published_at: @problem.published_at, statement: @problem.statement }
    end

    assert_redirected_to problem_path(assigns(:problem))
  end

  test "should show problem" do
    get :show, id: @problem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problem
    assert_response :success
  end

  test "should update problem" do
    patch :update, id: @problem, problem: { body: @problem.body, location: @problem.location, published_at: @problem.published_at, statement: @problem.statement }
    assert_redirected_to problem_path(assigns(:problem))
  end

  test "should destroy problem" do
    assert_difference('Problem.count', -1) do
      delete :destroy, id: @problem
    end

    assert_redirected_to problems_path
  end
end
