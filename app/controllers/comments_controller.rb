class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :get_parent


  require "pry"

  def get_parent

    if params[:project_id]
      @objparent = Project.find(params[:project_id])
      @template_prefix = 'project/comments/'

    elsif params[:partnership_id]
      @objparent = Partnership.find(params[:partnership_id])
      @template_prefix = 'partnership/comments/'

    elsif params[:problem_id]
      @objparent = Problem.find(params[:problem_id])
      @template_prefix = 'problem/comments/'

    elsif params[:profile_id]
      @objparent = Profile.find(params[:profile_id])
      @template_prefix = 'profile/comments/'

    elsif params[:search_problem_id]
      @objparent = Search_problem.find(params[:search_problem_id])
      @template_prefix = 'search_problem/comments/'

    elsif params[:simvol_id]
      @objparent = Simvol.find(params[:simvol_id])
      @template_prefix = 'simvol/comments/'

    elsif params[:solution_id]
      @objparent = Solution.find(params[:solution_id])
      @template_prefix = 'solution/comments/'

    elsif params[:friendship_id]
      @objparent = Friendship.find(params[:friendship_id])
      @template_prefix = 'friendship/comments/'

    elsif params[:comment_id]

      #binding.pry
      @op = Comment.find(params[:comment_id])
      @objparent = @op.commentable_type.constantize.find(@op.commentable_id)

  #    @op_params << @op.id
 #     @op_params << @op.commentable_type
#      @op_params << @op.commentable_id

      @template_prefix = 'comment/comments/'
      #binding.pry


    elsif params[:user_id]
      @objparent = User.find(params[:user_id])
      @template_prefix = 'user/profiles/'

    else
      @objparent = current_user
      @template_prefix = 'user/profiles/'
    end

  end

  # Then you can set up your index to be more generic
  def index

    @comments = @objparent.comments
    render :template => @template_prefix + 'index'
  end

  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new

    @comment = @objparent.comments.new

  end

  def edit
  end

  # POST /comments3
  # POST /comments.json
  def create
    #**********************
  #  binding.pry
   # @comment_hash = params[:comment]

    @p_obj = params[:comment][:commentable_type].constantize.find(params[:comment][:commentable_id])

    #@all_comments = @obj.comment_threads

    @comment = Comment.build_from(@p_obj, current_user.id, params[:comment])


    #@comment = Comment.build_from(@p_obj, current_user.id,  @comment_hash[:body], @comment_hash[:title], @comment_hash[:subject], @parentid)

    respond_to do |format|

      if @comment.save
#binding.pry

        if params[:comment][:op_id]

 #         binding.pry

          @op= Comment.find(params[:comment][:op_id])
          @comment.move_to_child_of(@op)

        end

 #binding.pry

        format.html { redirect_to @p_obj, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }



   #   if params[:comment_id]
    #   params[:parent_id => params[:commentable_id]]
     #  @comment.update
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
        format.html { redirect_to comment_params[:commentable_type].constantize.find(comment_params[:commentable_id]), notice: 'Comment was successfully updated.' }
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

  #************Voting
  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    redirect_to @comment.commentable
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_by current_user
    redirect_to @comment.commentable
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params

    params.require(:comment).permit(:body,:user_id, :op_id, :op_parentable, :op_parentable_id, :commentable_id, :commentable_type, :title, :subject, :parent_id, :lft, :rgt, :created_at, :updated_at)

  end

end
