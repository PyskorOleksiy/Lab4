class CoachesController < ApplicationController

  # GET /coaches or /coaches.json
  def index
    @coaches = Coach.all
  end

  # GET /coaches/1 or /coaches/1.json
  def show
    @club = Club.find(params[:club_id])
  end

  # GET /coaches/new
  def new
    @club = Club.find(params[:club_id])
  end


  # GET /coaches/1/edit
  def edit
    @club = Club.find(params[:club_id])
  end

  # POST /coaches or /coaches.json
  def create
    @club = Club.find(params[:club_id])
    @coach = @club.build_coach(coach_params)
    respond_to do |format|
      if @coach.save
        format.html { redirect_to club_path(@club), notice: "Coach was successfully created." }
        format.json { render :show, status: :created, location: club_path(@club) }
      end
    end
  end

  # PATCH/PUT /coaches/1 or /coaches/1.json
  def update
    @club = Club.find(params[:club_id])
    @coach = @club.coach
    respond_to do |format|
      if @coach.update(coach_params)
        format.html { redirect_to club_coach_path(@club), notice: "Coach was successfully updated." }
        format.json { render :show, status: :ok, location: club_coach_path(@club) }
      end
    end
  end

  # DELETE /coaches/1 or /coaches/1.json
  def destroy
    @club = Club.find(params[:club_id])
    @coach = @club.coach
    #Coach.delete_all
    @coach.destroy
     respond_to do |format|
      format.html { redirect_to club_coach_path(@club), notice: "Coach was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    

    # Only allow a list of trusted parameters through.
    def coach_params
      params.require(:coach).permit(:name, :contract_until, :age, :appointed, :preferred_formation, :avrg_coach_term, :club_id, :country, :last_club, :achievements)
    end
end
