class Solution < ApplicationRecord
	belongs_to :project, optional: true
	belongs_to :problem, optional: true

	has_many :comments, :as => :commentable, dependent: :destroy
	acts_as_commentable

	validates :project_id, :presence => true
	validates :problem_id, :presence => true
	#validates :role, :presence => true

  include PublicActivity::Common

end
