class Project < ActiveRecord::Base
	has_many :users, :through => :partnerships
	has_many :partnerships, dependent: :destroy


	has_many :problems, :through => :solutions
	has_many :solutions, dependent: :destroy
	#hehe... project has problems through solutions.
	has_many :simvols
	has_many :tags, :through => :simvols
	#has_many :comments, :as => :commentable, :dependent => destroy
	has_many :profiles, :as => :profileable, dependent: :destroy
	has_many :comments, :as => :commentable, dependent: :destroy

	validates :title, :presence => true
	validates :body, :presence => true
	validates :user_id, :presence => true

	acts_as_commentable
	acts_as_votable

	def long_title
		"#{title} - #{created_at}"
	end

  def self.search(keywords)
    projects = order(:created_at)
    projects = projects.where("title like ?", "%#{keywords}%") if keywords.present?
    projects = projects.where("body like ?", "%#{keywords}%") if keywords.present?
    projects
  end

#Rebeca June realpickylady@gmail.com

end
