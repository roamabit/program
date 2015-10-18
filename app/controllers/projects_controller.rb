class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

	attr_accessor :solution_abstract
	attr_accessor :problem_id


  #http_basic_authenticate_with name: "admin", password: "secret",    except: [:index, :show, :create, :new]

  # GET /projects
  # GET /projects.json


def index
	@projects = Project.all
	@current_user = current_user
	@recentprojects = Project.all.where("created_at > 'Date-10'").reverse

end


 #def add_new_comment
 #   project = Project.find(params[:id])
 #   project.comments << Project.new(params[:comment])
 #   redirect_to :action => :show, :id => project
 # end

  # GET /projects/1
  # GET /projects/1.json


def show
    @project = Project.find(params[:id])
   	@parent = @project
end

  # GET /projects/new
def new
	@project = Project.new


		 #Check whether New project is offered as a solution
#	if params[:problem_id].nil? == false
#		@project_id = @project.id
#		create_solution
#	end

  #parse out project name into simvols.
end

  # GET /projects/1/edit
  def edit


  end


  # POST /projects
  # POST /projects.json

#	def create
#	@user = current_user.id
#    @project = @user.projects.create(project_params)
#    redirect_to user_path(@user)
#	end


	 def create

   @project = Project.new(project_params)


  if @project.save


		 Partnership.create(:user_id => current_user.id, :project_id => @project.id, :role => 'Author')


    if params[:problem_id].nil? == false

      @project_id = project_params[:id]
      Solution.create(:problem_id => params[:problem_id], :project_id => @project.id, :published_at => Date.today, :solution_abstract => params[:solution_abstract])

    end #params[:problem_id]

    respond_to do |format|
      format.html { redirect_to @project, notice: 'Project was successfully created.' }
      format.json { render :show, status: :created, location: @project, user_id: @c_user }
    end #format do


  else

		respond_to do |format|
      format.html { render :new }
      format.json { render json: @project.errors, status: :unprocessable_entity }
		end #format do

  end #if @project.save



	  #simvol = Simvol.create(:name => @project.title)
	#simvol.tags << Simvol.find(13)

end #def create
#*************************************************



  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json

  def destroy
	#Simvol.find_by_name(@project.title).destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :body, :published_at,  :user_id)
    end


end
