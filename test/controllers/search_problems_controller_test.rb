require 'test_helper'

class SearchProblemsControllerTest < ActionController::TestCase
  setup do
    @search_problem = search_problems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_problems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_problem" do
    assert_difference('SearchProblem.count') do
      post :create, search_problem: { date_max: @search_problem.date_max, date_min: @search_problem.date_min, keywords: @search_problem.keywords, location: @search_problem.location, location_distance: @search_problem.location_distance, user_id: @search_problem.user_id }
    end

    assert_redirected_to search_problem_path(assigns(:search_problem))
  end

  test "should show search_problem" do
    get :show, id: @search_problem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search_problem
    assert_response :success
  end

  test "should update search_problem" do
    patch :update, id: @search_problem, search_problem: { date_max: @search_problem.date_max, date_min: @search_problem.date_min, keywords: @search_problem.keywords, location: @search_problem.location, location_distance: @search_problem.location_distance, user_id: @search_problem.user_id }
    assert_redirected_to search_problem_path(assigns(:search_problem))
  end

  test "should destroy search_problem" do
    assert_difference('SearchProblem.count', -1) do
      delete :destroy, id: @search_problem
    end

    assert_redirected_to search_problems_path
  end
end
