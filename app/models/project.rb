class Project < ActiveRecord::Base
	has_many :users, :through => :partnerships
	has_many :partnerships, dependent: :destroy


	has_many :problems, :through => :solutions
	has_many :solutions, dependent: :destroy
	#hehe... project has problems through solutions.
	has_many :simvols
	has_many :tags, :through => :simvols

	has_many :profiles, :as => :profileable, dependent: :destroy
	has_many :comments, :as => :commentable, dependent: :destroy

	validates :title, :presence => true
	validates :body, :presence => true
	validates :user_id, :presence => true

	acts_as_commentable
	acts_as_votable

  #For Groupify Gem
  groupify :group_member

  include PublicActivity::Common


	def long_title
		"#{title} - #{created_at}"
	end

#  def self.search(keywords)
#    projects = order(:created_at)
#    projects = projects.where("title like ? or body like ?", "%#{keywords}%","%#{keywords}%") if keywords.present?
#    projects
#  end

##  def self.search(query)
  #  projects = order(:created_at)
#
 #   words = query.to_s.downcase.strip.split(/\W+/).uniq
  #  words.each do |word|
#
 #     wordprojects = self.where("title LIKE ? or body like ?", "%#{word}%", "%#{word}%")
  #    projects = projects & wordprojects
   # end

 # end

    def self.search(query)
      words = query.to_s.downcase.strip.split(/\W+/).uniq
      words.map! { |word| "title LIKE '%#{word}%' or body LIKE '%#{word}%'" }
      sql = words.join(" or ")
      self.where(sql).order('created_at desc')
    end

end
