class Profile < ActiveRecord::Base
  # belongs_to :user
  belongs_to :profileable, :polymorphic =>true
  has_many :comments, :as => :commentable, dependent: :destroy

  validates_presence_of :user_id, :profileable_id, :profileable_type
  acts_as_commentable
  acts_as_votable

  #@profile.liked_by @user
  #@profile.votes_for.size


  def self.search(keywords, profileable_type)
    profiles = order(:name)
    profiles = profiles.where("bio like ?", "%#{keywords}%") if keywords.present?
    profiles = profiles.where("profileable_type =?", "#{profileable_type}")
    profiles
  end

  def self.find_profileable(profileable_str, profileable_id)
    profileable_str.constantize.find(profileable_id)
  end

  def self.build_from(obj, user_id, bio, title, madepublic)
    new \
      :profileable => obj,
    :bio        => bio,
    :user_id     => user_id,
    :name		=> title,
    :made_public_at => madepublic
  end

end
