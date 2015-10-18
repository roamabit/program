class Friendship < ActiveRecord::Base

    belongs_to :user, dependent: :destroy
    belongs_to :friend, :class_name => "User"
    has_many :comments, :as => :commentable, dependent: :destroy

    acts_as_commentable
    acts_as_votable

end
