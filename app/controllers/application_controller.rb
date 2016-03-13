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
      elsif params[:project]
        @p = @project
      elsif params[:friendship] or params[:friend_id] or request.original_fullpath.include?("friend")
        @p = @friendship
      elsif params[:partnership]
        @p = @partnership
      elsif params[:supporter]
        @p = @supporter
      elsif params[:profile]
        @p = @profile
      elsif params[:search_problem]
        @p = @search_problem
      elsif params[:solution]
        @p = @solution
      elsif params[:user]
        @p = @user
      elsif
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

  end #def log_activity




end
