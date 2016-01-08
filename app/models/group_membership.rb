class GroupMembership < ActiveRecord::Base
  groupify :group_membership



def mship(id, type)
  group_memberships(member_id: id, member_type: type)
end

end
