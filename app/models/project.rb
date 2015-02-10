class Project < ActiveRecord::Base

	has_many :partnerships, dependent: :destroy
	 
	has_many :users, :through => :partnerships
	has_many :problems, :through => :solutions
	#hehe... project has problems through solutions. 
	has_many :simvols
	has_many :tags, :through => :simvols
	#has_many :comments, :as => :commentable, :dependent => destroy
	has_many :profiles, :as => :profileable, dependent: :destroy

	validates :title, :presence => true
	validates :body, :presence => true
	validates :user_id, :presence => true
	
	has_many :comments, :as => :commentable, dependent: :destroy
	acts_as_commentable
	
	def long_title
		"#{title} - #{created_at}"
	end
	
#Rebeca June realpickylady@gmail.com
	
end
