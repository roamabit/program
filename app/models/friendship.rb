class Friendship < ApplicationRecord

    belongs_to :user, optional: true
    belongs_to :friend, :class_name => "User", optional: true
    has_many :comments, :as => :commentable, dependent: :destroy

    acts_as_commentable
    acts_as_votable

    validates_presence_of :user_id, :friend_id

    include PublicActivity::Common

end
