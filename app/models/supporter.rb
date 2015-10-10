class Supporter < ActiveRecord::Base

  belongs_to :problem
  belongs_to :user
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :profiles, :as => :profileable, dependent: :destroy
  acts_as_commentable
  acts_as_votable

  validates :problem_id, :presence => true
  validates :user_id, :presence => true
  validates :role, :presence => true

end
