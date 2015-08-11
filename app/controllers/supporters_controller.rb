class SupportersController < ApplicationController

before_action :set_supporter, only: [:show, :edit, :update, :destroy]


  def index
    @supporters = current_user.supporters
  end

  # GET /supporters/1
  # GET /supporters/1.json

  def show
     @supporters = current_user.supporters
  end

  # GET /supporters/new
  def new
    @supporter = Supporter.new()
  end

  # GET /supporters/1/edit
  def edit
     @supporters = current_user.supporters
  end

  # POST /supporters
  # POST /supporters.json
  def create

    @supporter = Supporter.new(supporter_params)

    respond_to do |format|
      if @supporter.save
        format.html { redirect_to @supporter, notice: 'supporter was successfully created.' }
        format.json { render :show, status: :created, location: @supporter }
      else
        format.html { render :new }
        format.json { render json: @supporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supporters/1
  # PATCH/PUT /supporters/1.json

  def update
    respond_to do |format|
      if @supporter.update(supporter_params)
        format.html { redirect_to @supporter, notice: 'supporter was successfully updated.' }
        format.json { render :show, status: :ok, location: @supporter }
      else
        format.html { render :edit }
        format.json { render json: @supporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supporters/1
  # DELETE /supporters/1.json
  def destroy
    @supporter.destroy
    respond_to do |format|
      format.html { redirect_to supporters_url, notice: 'supporter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
   #************Voting
  def upvote
    @supporter = Supporter.find(params[:id])
    @supporter.upvote_by current_user
    redirect_to @supporter
  end

  def downvote
    @supporter = Supporter.find(params[:id])
    @supporter.downvote_by current_user
    redirect_to @supporter
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supporter
      @supporter = Supporter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supporter_params
   params.require(:supporter).permit(:user_id, :problem_id, :created_at, :updated_at, :role)

    end

end
