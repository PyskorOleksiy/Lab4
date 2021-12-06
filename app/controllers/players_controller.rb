class PlayersController < ApplicationController
   
  def all_players
    @players = Player.all
  end

  # GET /players or /players.json
  def index
    @club = Club.find(params[:club_id])
    @players = Player.all
  end

  # GET /players/1 or /players/1.json
  def show
    @player = Player.find(params[:id])
    @club = Club.find(params[:club_id])
  end

  # GET /players/new
  def new
    @club = Club.find(params[:club_id])
  end
  # GET /players/1/edit
  def edit
    @club = Club.find(params[:club_id])
    @player = Player.find(params[:id])
  end

  # POST /players or /players.json
  def create
    @club = Club.find(params[:club_id])
    @player = @club.players.create(player_params)
    respond_to do |format|
      if @player.save
        format.html { redirect_to club_players_path(@club), notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: club_players_path(@club) }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    @club = Club.find(params[:club_id])
    @player = @club.players.find(params[:id])
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to club_players_path(@club), notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: club_players_path(@club) }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @club = Club.find(params[:club_id])
    @player = @club.players.find(params[:id])
    #Player.delete_all
    @player.destroy
     respond_to do |format|
      format.html { redirect_to club_players_path(@club), notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:name, :position, :number, :age, :country, :contract_until, :market_value, :cost_type, :club_id)
    end
end
