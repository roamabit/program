class Partnership < ApplicationRecord
	#default_scope {where( :user_id => current_user.id )}

	#scope: :c_user => { where(:user_id => current_user.id) }
	#scope :c_user, -> { where(user_id: current_user.id) }
  	#attr_accessor :current_user

	belongs_to :project, optional: true
	belongs_to :user, optional: true
	has_many :comments, :as => :commentable, dependent: :destroy
	acts_as_commentable
	acts_as_votable

	#default_scope -> {where :user_id == current_user.id}


	validates :project_id, :presence => true
	validates :user_id, :presence => true
	validates :role, :presence => true

  include PublicActivity::Common


end
