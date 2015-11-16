class Problem < ActiveRecord::Base
  has_many :projects, :through => :solutions
  has_many :solutions, dependent: :destroy #Projects Link

  has_many :users, :through => :supporters
  has_many :supporters, dependent: :destroy #Users Link


  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :profiles, :as => :profileable, dependent: :destroy

  validates_presence_of :statement, :body
  
  acts_as_votable
  acts_as_commentable

  geocoded_by :location   # can also be an IP address
  after_validation :geocode,   :if => :location_change       # auto-fetch coordinates


  def self.search(keywords)
    problems = order(:statement)
    problems = problems.where("statement like ?", "%#{keywords}%") if keywords.present?
    problems
  end


end

