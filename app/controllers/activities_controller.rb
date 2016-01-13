class ActivitiesController < ApplicationController
  def index
  @activities = PublicActivity::Activity.order("created_at desc").where(current_user.friends, owner_type: "User")

  end
end
