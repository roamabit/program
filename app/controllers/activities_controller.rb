class ActivitiesController < ApplicationController

  def index

  @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.friends, owner_type: "User")
  #warning - This is duplicated in the user_controller#show need to build ref insted.
  end
end
