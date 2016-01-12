class ProfilesController < ApplicationController

	before_filter :get_parent, only: [:new, :create]
attr_accessor :user_id, :new_profile_name
	before_action :set_profile, only: [:show, :edit, :update, :destroy]

	def index

		get_parent

		@profiles = Profile.all

		if params[:search]
			#@profiles = Profile.users
			profile_search

		end

	end

	def profile_search

		@profiles = Profile.search(params[:search], params[:profileable_type])


		#ideas: Pass the buck to another controller
		#polymorph right here and output the right parent collection
		#... user_profiles search should be able to do this...


	end


	def show

	end

	def create

		@profile_hash = params[:profile]

		@obj = @profile_hash[:profileable_type].constantize.find(@profile_hash[:profileable_id])

			if params[:new_profile_name]==''
		@profile_name = @profile_hash[:name]
			else

		@profile_name = params[:new_profile_name]
			end

		@profile = Profile.build_from(@obj, current_user.id,  @profile_hash[:bio], @profile_name, @profile_hash[:made_public_at])




		respond_to do |format|
		  if @profile.save

      log_activity


			format.html { redirect_to @obj, notice: 'Profile was successfully created.' }
			format.json { render :show, status: :created, bio: @profile }
		  else
			format.html { render :new }
			format.json { render json: @profile.errors, status: :unprocessable_entity }
		  end
    	end
	end



	def new
		get_parent
		get_options_list
		@profile = @objparent.profiles.new
	end

	def update
		  respond_to do |format|
			  if @profile.update(profile_params)

        log_activity


				format.html { redirect_to @profile, notice: 'profile was successfully updated.' }
				format.json { render :show, status: :ok, location: @profile }
			  else
				format.html { render :edit }
				format.json { render json: @profile.errors, status: :unprocessable_entity }
			  end
		  end
	end

	 def destroy
	get_parent
    @profile.destroy

      #log_activity #doesnt work with call backs


		respond_to do |format|
      format.html { redirect_to @objparent, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


	def get_parent

		if params[:project_id]
		  @objparent = Project.find(params[:project_id])
		  @template_prefix = 'project/profiles/'

		elsif params[:partnership_id]
		  @objparent = Partnership.find(params[:partnership_id])
		  @template_prefix = 'partnership/profiles/'

		elsif params[:problem_id]
		  @objparent = Problem.find(params[:problem_id])
		  @template_prefix = 'problem/profiles/'

		elsif  params[:profileable_type]
		  @p_type = params[:profileable_type].singularize.capitalize.constantize
		  @objparent = @p_type.find(profile_params[:profileable_id]) unless params[:search]
		  @template_prefix = "#{@p_type.to_s.downcase}" + '/profiles/'

		elsif params[:profile_id]
		  @objparent = Profile.find(params[:profile_id])
		  @template_prefix = 'profile/profiles/'

		elsif params[:search_problem_id]
		  @objparent = Search_problem.find(params[:search_problem_id])
		  @template_prefix = 'search_problem/profiles/'

		elsif params[:simvol_id]
		  @objparent = Simvol.find(params[:simvol_id])
		  @template_prefix = 'simvol/profiles/'

		elsif params[:solution_id]
		  @objparent = Solution.find(params[:solution_id])
		  @template_prefix = 'solution/profiles/'

		elsif params[:comment_id]
		  @objparent = Comment.find(params[:comment_id])
		  @template_prefix = 'comment/profiles/'
		  @parentid = params[:commentable_id]

		elsif params[:user_id]
		  @objparent = current_user
		  @template_prefix = 'user/profiles/'

		elsif params[:id]
			@profile_lookup = Profile.find(params[:id])
			@parent_object = @profile_lookup.profileable_type.constantize
			@objparent = @parent_object.find(@profile_lookup.profileable_id)

		end
    end


	def self_profiles
		get_parent
	end

	def set_profile
	#	get_parent
		@profile = Profile.find(params[:id])
	end


	def get_options_list

		if params[:user_id]
			 @list = ['Name','Alias','Location','Skill','Interest','Passion']
		 elsif params[:project_id]
			 @list = ['Google Hangout','Pinterest','Facebook','Meetup','Trello','GitHub']
		 elsif params[:partnership_id]
			 @list = ['I can help with','I want to be involved in']
		 elsif params[:problem_id]
			 @list = ['Pinterest','Legal','Government Contact','Hangout']
		 elsif params[:profile_id]
			 @list = ['Other']
		 elsif params[:search_problem_id]
			 @list = ['Other']
		 elsif params[:simvol_id]
			 @list = ['Other']
		 elsif params[:solution_id]
			 @list = ['Other']
		 elsif params[:comment_id]
			 @list = ['Other']
		 end

	end

#************Voting
	def upvote
		@profile = Profile.find(params[:id])
		@profile.upvote_by current_user
		redirect_to @profile
	end

	def downvote
	  @profile = Profile.find(params[:id])
	  @profile.downvote_by current_user
	  redirect_to @profile
	end

	 def profile_params
	  	params.require(:profile).permit(:user_id, :name, :bio, :created_at, :updated_at, :made_public_at, :profileable_id, :profileable_type, :new_profile_name)
	end





end
