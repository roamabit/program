class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  #,:confirmable
  #, :lockable, :timeoutable, :omniauthable

  has_many :search_problems
  has_many :partnerships, dependent: :destroy
  has_many :projects, :through => :partnerships
  has_many :supporters, dependent: :destroy
  has_many :problems, :through => :supporters
  has_many :profiles, :as => :profileable, dependent: :destroy
  has_many :comments, :as => :commentable, dependent: :destroy
  acts_as_commentable
  acts_as_votable

  #Yay Friends!
  has_many :friendships, dependent: :destroy
  has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

  has_many :active_friends, -> { where(friendships: { approved: true}) }, :through => :friendships, :source => :friend
  has_many :passive_friends, -> { where(friendships: { approved: true}) }, :through => :passive_friendships, :source => :user
  has_many :pending_friends, -> { where(friendships: { approved: false}) }, :through => :friendships, :source => :friend
  has_many :requested_friendships, -> { where(friendships: { approved: false}) }, :through => :passive_friendships, :source => :user

#For Groupify Gem
  groupify :group_member
  groupify :named_group_member


  def friends
    active_friends | passive_friends
  end

  def self.search(query)
    words = query.to_s.downcase.strip.split(/\W+/).uniq
    words.map! { |word| "email LIKE '%#{word}%'" }
    sql = words.join(" or ")
    self.where(sql).order('created_at desc')

  end


end
