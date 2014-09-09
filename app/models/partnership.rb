class Partnership < ActiveRecord::Base
	#default_scope {where( :user_id => current_user.id )}
	
	#scope: :c_user => { where(:user_id => current_user.id) }
	#scope :c_user, -> { where(user_id: current_user.id) }
  	#attr_accessor :current_user
	belongs_to :project
	belongs_to :user
	
	#default_scope -> {where :user_id == current_user.id}
	
	
	validates :project_id, :presence => true
	validates :user_id, :presence => true
	validates :role, :presence => true
	
end
