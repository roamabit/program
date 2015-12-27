class Group < ActiveRecord::Base
  groupify :group

def mship
  self.group_memberships
end


end
