class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	
	has_many :partnerships, dependent: :destroy

	has_many :projects, :through => :partnerships
	#, :order => :published_at DESC,  :title ASC
	
		
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	has_one :profile, dependent: :destroy

	
end
