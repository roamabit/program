class Supporter < ApplicationRecord

  belongs_to :problem, optional: true
  belongs_to :user, optional: true
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :profiles, :as => :profileable, dependent: :destroy
  acts_as_commentable
  acts_as_votable

  validates :problem_id, :presence => true
  validates :user_id, :presence => true
  validates :role, :presence => true

  include PublicActivity::Common


end
