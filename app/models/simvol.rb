class Simvol < ActiveRecord::Base
	has_many :simtags, dependent: :destroy
	has_many :tags, :through => :simtags, :source => :tag
	has_many :comments, :as => :commentable, dependent: :destroy
acts_as_commentable

	attr_accessor :currentsimvol

end
