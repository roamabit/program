class Simtag < ApplicationRecord
	belongs_to :simvol, optional: true
	belongs_to :tag, :class_name => "Simvol", optional: true
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
