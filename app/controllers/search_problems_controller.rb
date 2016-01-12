class SearchProblemsController < ApplicationController
  before_action :set_search_problem, only: [:show, :edit, :update, :destroy]

  # GET /search_problems
  # GET /search_problems.json
  def index
    @search_problems = SearchProblem.all
  end

  # GET /search_problems/1
  # GET /search_problems/1.json
  def show
  end

  # GET /search_problems/new
  def new
    @search_problem = SearchProblem.new
  end

  # GET /search_problems/1/edit
  def edit
  end

  # POST /search_problems
  # POST /search_problems.json
  def create
    @search_problem = SearchProblem.new(search_problem_params)

    respond_to do |format|
      if @search_problem.save

        log_activity


        format.html { redirect_to @search_problem, notice: 'Search problem was successfully created.' }
        format.json { render :show, status: :created, location: @search_problem }
      else
        format.html { render :new }
        format.json { render json: @search_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_problems/1
  # PATCH/PUT /search_problems/1.json
  def update
    respond_to do |format|
      if @search_problem.update(search_problem_params)

        log_activity


        format.html { redirect_to @search_problem, notice: 'Search problem was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_problem }
      else
        format.html { render :edit }
        format.json { render json: @search_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_problems/1
  # DELETE /search_problems/1.json
  def destroy
    @search_problem.destroy


      #log_activity #doesnt work with call backs


    respond_to do |format|
      format.html { redirect_to search_problems_url, notice: 'Search problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_problem
      @search_problem = SearchProblem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_problem_params
      params.require(:search_problem).permit(:user_id, :keywords, :date_min, :date_max, :location, :location_distance)
    end
end
