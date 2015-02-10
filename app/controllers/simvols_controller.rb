class SimvolsController < ApplicationController
	
before_action :set_simvol, only: [:show, :edit, :update, :destroy]
	attr_accessor :currentsimvol


	
	
	def set_simvol
      @simvol = Simvol.find(params[:id])
    end
	
	def show
	end
	

	def index
		@simvols = Simvol.all
	end
		
	
	def new
		
			#@simvol = Simvol.new(simvol_params)
		
			@simvol = Simvol.new
		
	end
	
	def create
		@simvol = Simvol.new(simvol_params)
		
	  respond_to do |format|
			if @simvol.save
			format.html { redirect_to @simvol, notice: 'simvol was successfully created.' }
			format.json { render :show, status: :created, location: @simvol }
			
		if Simvol.find_by_name(params[:currentsimvol]).nil? == true
			
			format.html { render :new }
			format.json { render json: @simvol.errors, status: :unprocessable_entity }
			else
			
			 @simvol.tags << Simvol.find_by_name(params[:currentsimvol])
		end
				
			else
			format.html { render :new }
			format.json { render json: @simvol.errors, status: :unprocessable_entity }
				
			end
    	end
		
		
	end
	
	
	
	def update
    respond_to do |format|
      if @simvol.update(simvol_params)
        format.html { redirect_to @simvol, notice: 'simvol was successfully updated.' }
        format.json { render :show, status: :ok, location: @simvol }
      else
        format.html { render :edit }
        format.json { render json: @simvol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simvol/1
  # DELETE /simvol/1.json
  def destroy
	#Simvol.find_by_name(@project.title).destroy
    @simvol.destroy
    respond_to do |format|
      format.html { redirect_to simvols_url, notice: 'simvol was successfully destroyed.' }
      format.json { head :no_content }
    end
  end






	 def simvol_params
		 
	  	params.require(:simvol).permit(:name, :created_at, :updated_at, :currentsimvol)
			end

end