class UsersController < ApplicationController

  def index
    @users = User.all
    search_setup  if params[:search]


  end


  def search_setup
    # part of index
    @users = User.search(params[:search])
    @profiles = Profile.search(params[:search], params[:profileable_type=>'User'])
  end

  def show

    if params[:format] #not sure why this is needed (MR)
      @user = User.find(params[:format])
    else
      @user = User.find(params[:id])
    end
    #	end
    #Generate user activities
    if @user == current_user
      @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.friends, owner_type: "User")
    end

  end

  # Voting
  def upvote
    @user = User.find(params[:id])
    @user.upvote_by current_user
    redirect_to @user
  end

  def downvote
    @user = User.find(params[:id])
    @user.downvote_by current_user
    redirect_to @user
  end


  private
  def user_params
    params.require(:user).permit(:email, :created_at)
  end

end
