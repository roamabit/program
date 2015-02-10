class SearchProblem < ActiveRecord::Base
	
	has_many :comments, :as => :commentable, dependent: :destroy
	acts_as_commentable
	
	geocoded_by :location   # can also be an IP address
after_validation :geocode,   :if => :location_change       # auto-fetch coordinates
	
	
	def problems
		@problems ||= find_problems
	end

private
	
	def find_problems
		problems = Problem.order(:statement)
		problems = problems.where("statement like ?", "%#{keywords}%") if keywords.present?
		problems = problems.where("published_at >= ?", date_min) if date_min.present?
		problems = problems.where("published_at <= ?", date_max) if date_max.present?
		problems = problems.near(location,location_distance)
		problems
	end
	
end