class Group < ActiveRecord::Base
  #groupify :group

  groupify :group, members: [:users, :projects], default_members: :users


def index
  @groups = Groups.all
end


end
