class Project < ActiveRecord::Base

	has_many :partnerships, dependent: :destroy
	
	has_many :users, :through => :partnerships
	

	validates :title, :presence => true
	validates :body, :presence => true
	validates :user_id, :presence => true

	def long_title
		"#{title} - #{created_at}"
	end
	
	
end
