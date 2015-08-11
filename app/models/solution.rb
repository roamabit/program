class Solution < ActiveRecord::Base
	belongs_to :project
	belongs_to :problem
  belongs_to :user
	has_many :comments, :as => :commentable, dependent: :destroy
	acts_as_commentable

	validates :project_id, :presence => true
	validates :problem_id, :presence => true
	#validates :role, :presence => true


end
