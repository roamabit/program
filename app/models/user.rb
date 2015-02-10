class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	
	has_many :partnerships, dependent: :destroy

	has_many :projects, :through => :partnerships
	#, :order => :published_at DESC,  :title ASC
	has_many :comments

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	has_many :profiles, :as => :profileable, dependent: :destroy
	
	has_many :comments, :as => :commentable, dependent: :destroy
	
	acts_as_commentable


end
