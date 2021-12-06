class AwaysController < ApplicationController
  

  # GET /homes or /homes.json
  def index
    @aways = Away.all
  end

  # GET /homes/1 or /homes/1.json
  def show
    @tournament = Tournament.find(params[:tournament_id])
    @away = Away.find(params[:id])
  end

  # GET /homes/new
  def new
    @tournament = Tournament.find(params[:tournament_id])
  end

  # GET /homes/1/edit
  def edit
    @tournament = Tournament.find(params[:tournament_id])
    @away = Away.find(params[:id])
  end

  # POST /homes or /homes.json
  def create
    @tournament = Tournament.find(params[:tournament_id])
    @away = @tournament.aways.create(away_params)

    respond_to do |format|
      if @away.save
        format.html { redirect_to tournament_path(@tournament), notice: "Away was successfully created." }
        format.json { render :show, status: :created, location: tournament_path(@tournament) }
      end
    end
  end

  # PATCH/PUT /homes/1 or /homes/1.json
  def update
    @tournament = Tournament.find(params[:tournament_id])
    @away = @tournament.aways.find(params[:id])
    respond_to do |format|
      if @away.update(away_params)
        format.html { redirect_to tournament_path(@tournament), notice: "Away was successfully updated." }
        format.json { render :show, status: :ok, location: tournament_path(@tournament) }
      end
    end
  end

  # DELETE /homes/1 or /homes/1.json
  def destroy
    @tournament = Tournament.find(params[:tournament_id])
    @away = @tournament.aways.find(params[:id])
    @away.destroy
    respond_to do |format|
      format.html { redirect_to tournament_path(@tournament), notice: "Away was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    

    # Only allow a list of trusted parameters through.
    def away_params
      params.require(:away).permit(:tour, :match_date, :home_team, :result, :away_team, :tournament_id)
    end
end
