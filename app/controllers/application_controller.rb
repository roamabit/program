class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
include PublicActivity::StoreController

 protect_from_forgery with: :exception

 def after_sign_in_path_for(user)
    problems_path
 end

  def log_activity
#this whole thing needs to be rewritten
#to take advantage of this info already in the params
#I think this can be reduced to three lines.
#@p = params[:<pull out the oject somehow>]
#@a = params[:<pull out the commit action>]
#@p.create activity @a , owner:current_user
    #unless params[:_method].to_s.include? "delete"

      if params[:problem] #@p setup
        @p = @problem
         @mailer_note = "A new problem has been posted"
         @url = problem_url(@p, host: 'www.eightkm.com')
      elsif params[:project]
        @p = @project
         @mailer_note = "A new project has been posted"
        @url = project_url(@p, host: 'www.eightkm.com')

      elsif params[:friendship] or params[:friend_id] or request.original_fullpath.include?("friend")
        @p = @friendship
         @mailer_note = "A new friendship was made."
                 @url = friendship_url(@p, host: 'www.eightkm.com')

      elsif params[:partnership]
        @p = @partnership
         @mailer_note = "A new person joined the project."
        @url = partnership_url(@p, host: 'www.eightkm.com')

      elsif params[:supporter]
        @p = @supporter
         @mailer_note = "A new supporter sees the problem."
        @url = supporter_url(@p, host: 'www.eightkm.com')

      elsif params[:profile]
        @p = @profile

        @mailer_note = "A new profile has been posted."
        @url = profile_url(@p, host: 'www.eightkm.com')

      elsif params[:search_problem]
        @p = @search_problem
         @mailer_note = "A new search has been posted."
         @url = search_problem_url(@p, host: 'www.eightkm.com')

      elsif params[:solution]
        @p = @solution
         @mailer_note = "A new solution has been posted."
         @url = solution_url(@p, host: 'www.eightkm.com')

      elsif params[:user]
        @p = @user
        @url = user_url(@p, host: 'www.eightkm.com')

      elsif params[:comment]
        @p = @comment
        @mailer_note = "A new comment has been posted"
        @url = comment_url(@p, host: 'www.eightkm.com')

      else
        bomb
      end #@p setup


      if params[:commit].to_s.include? "Update" #action
        @p.create_activity :update, owner: current_user
      elsif params[:commit].to_s.include? "Create"
        @p.create_activity :create, owner: current_user
      else
        @p.create_activity :create, owner: current_user
      end #action
    #end

    ModelMailer.new_record_notification(User.find(1).email, @p, @mailer_note, @url).deliver
    ModelMailer.new_record_notification(current_user.email, @p, @mailer_note, @url).deliver

  end #def log_activity




end
