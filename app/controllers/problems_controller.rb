class ProblemsController < ApplicationController
 before_action :set_problem, only: [:show, :edit, :update, :destroy, :clone]
  attr_accessor :problem, :statement, :body, :problem_params

  # GET /problems
  # GET /problems.json


  def index
    @problems = Problem.all

	 search_setup
	 gmaps_setup

  end

  def search_setup
	 	# part of index
  		@problems = Problem.search(params[:search])
  end

  def gmaps_setup
	 #gmaps4Rails part of index
  	@hash = Gmaps4rails.build_markers(@problems) do |problem, marker|
    	marker.lat problem.latitude
    	marker.lng problem.longitude
    	marker.infowindow problem.body
    	#marker.picture({	  "url" => view_context.image_path('/Check.png'),"width" => 512,"height" => 512	  })
    	marker.json({title: problem.statement}) #Group Problems by Category?
  	end

  end

  # GET /problems/1
  # GET /problems/1.json

  def show
	 # @problem = Problem.find(params[:id])
	  @objparent = @problem
  end

  # GET /problems/new
  def new
      #@problem = current_user.problems.build
      @problem = Problem.new

  end

	def clone
    @problem = Problem.find(params[:id]) # find original object
    @problem = Problem.new(@problem.attributes) # initialize duplicate (not saved)
    render :new # render same view as "new",
                #but with @problem attributes already filled in
	end

  # GET /problems/1/edit
  def edit

  end

  # POST /problems
  # POST /problems.json
  def create

  @problem = Problem.new(problem_params)


      if @problem.save

        Supporter.create(:user_id => current_user.id,
          :problem_id => @problem.id, :role => 'Author')


        if params[:user_id].nil? == false

          @problem_id = problem_params[:id]
          Supporter.create(:user_id => params[:user_id],
            :problem_id => @problem.id, :role => 'Supporter')

        else

          respond_to do |format|
            format.html { redirect_to @problem,
            notice: 'Problem was successfully created.' }
            format.json { render :show,
            status: :created, location: @problem }
          end #format
      end # user_id

      else
        respond_to do |format|
        format.html { render :new }
        format.json { render json: @problem.errors,
        status: :unprocessable_entity }
        end #format

      end #save if

  end #create



  # PATCH/PUT /problems/1
  # PATCH/PUT /problems/1.json
  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to @problem, notice: 'Problem was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem }
      else
        format.html { render :edit }
        format.json { render json: @problem.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url,
        notice: 'Problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	 #************Voting
	def upvote
		@problem = Problem.find(params[:id])
		@problem.upvote_by current_user
		redirect_to @problem
	end

	def downvote
	  @problem = Problem.find(params[:id])
	  @problem.downvote_by current_user
	  redirect_to @problem
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Never trust parameters from the scary internet,
    #only allow the white list through.

    def problem_params
      params.require(:problem).permit(:statement, :body,
        :published_at, :location, :user_id)
    end
end

