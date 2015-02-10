class Simtag < ActiveRecord::Base
	belongs_to :simvol
	belongs_to :tag, :class_name => "Simvol"
acts_as_commentable

	after_create :connect__bothways
	after_destroy :delete_both__connections


def connect__bothways
	tag.tags << simvol unless tag.tags.include?(simvol)
	end

def delete_both__connections
	tag.tags.delete(simvol)
	end
	
end