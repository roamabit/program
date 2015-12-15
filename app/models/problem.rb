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

  #on public_activity Branch
  include PublicActivity::Common
    #tracked owner: ->(controller, model) { controller && controller.current_user }
    #http://railscasts.com/episodes/406-public-activity



    def self.search(query)
      words = query.to_s.downcase.strip.split(/\W+/).uniq
      words.map! { |word| "statement LIKE '%#{word}%' or body LIKE '%#{word}%'" }
      sql = words.join(" or ")
      self.where(sql).order('created_at desc')
    end


  #part of CSV download
  def self.to_csv(options={})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |problem|
        csv << problem.attributes.values_at(*column_names)
      end
    end
  end



end

