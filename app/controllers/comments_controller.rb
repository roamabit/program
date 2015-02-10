class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
	attr_accessor :parent_id
	
  before_filter :get_parent
	
	def make_a_child
		@comment.move_to_child_of(Comment.find(@comment.commentable_id))
		end
	
  def get_parent

		if params[:project_id]
		  @parent = Project.find(params[:project_id])
		  @template_prefix = 'project/comments/'
			
		elsif params[:partnership_id]
		  @parent = Partnership.find(params[:partnership_id])
		  @template_prefix = 'partnership/comments/'
		
		elsif params[:problem_id]
		  @parent = Problem.find(params[:problem_id])
		  @template_prefix = 'problem/comments/'
					
		elsif params[:profile_id]
		  @parent = Profile.find(params[:profile_id])
		  @template_prefix = 'profile/comments/'
			
		elsif params[:search_problem_id]
		  @parent = Search_problem.find(params[:search_problem_id])
		  @template_prefix = 'search_problem/comments/'	
		
		elsif params[:simvol_id]
		  @parent = Simvol.find(params[:simvol_id])
		  @template_prefix = 'simvol/comments/'
			
		elsif params[:solution_id]
		  @parent = Solution.find(params[:solution_id])
		  @template_prefix = 'solution/comments/'		

		elsif params[:comment_id]
		  @parent = Comment.find(params[:comment_id])
		  @template_prefix = 'comment/comments/'
		  @parentid = params[:commentable_id]
		
		elsif params[:user_id]
		  @parent = User.find(params[:user_id])
		  @template_prefix = 'user/profiles/'
			
		else
			@parent = current_user
			@template_prefix = 'user/profiles/'
    end

  end

	def make_a_baby
		@comment.make_child_of(Comment.find(72))
	end
	
  # Then you can set up your index to be more generic
  def index

    @comments = @parent.comments.all
    render :template => @template_prefix + 'index'
  end

  # GET /comments
  # GET /comments.json
  #def index
  #  @comments = Comment.all
  #end

  # GET /comments/1
  # GET /comments/1.json
  def show
	@comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new

	 	#@comment= Comment.build_from(@parent,current_user.id,params[:body])
	  @comment = @parent.comments.new

  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments3
  # POST /comments.json
  def create
	  #**********************
@comment_hash = params[:comment]
@obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
  #  @all_comments = @obj.comment_threads
    if (params[:comment].has_key?(:parent_id))
      @parent = Comment.find(params[:comment][:parent_id])
    end

@comment = Comment.build_from(@obj, current_user.id,  @comment_hash[:body], @comment_hash[:title], @comment_hash[:subject], @parentid)

    	  
   respond_to do |format|
	
	   
      if @comment.save
		  
	   	#grandchild.move_to_child_of(@obj)

        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
		
		  
		  
		#if params[:comment_id]
		# params[:parent_id => params[:commentable_id]]
		# @comment.update
		#end
	
		  
      else
		  @comment.errors
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
	def set_comment
		@comment = Comment.find(params[:id])
	end

    # Never trust parameters from the scary internet, only allow the white list through.
	def comment_params

		params.require(:comment).permit(:body,:user_id, :commentable_id, :commentable_type, :title, :subject, :parent_id, :lft, :rgt, :created_at, :updated_at)
	
	end

end
