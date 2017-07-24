class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :join]
  @@image_urls = {
    soccer: [
      'http://cdn.mysitemyway.com/icons-watermarks/simple-black/',
      'classica/classica_soccer-ball/',
      'classica_soccer-ball_simple-black_512x512.png',
    ].join,
    basketball: [].join,
    default: ['http://www.iconninja.com/',
              'files/333/190/480/sport-handball-icon',
              '.svg'].join
  }
  dimension = '20'
  # string 'widthxheight' for image_tag
  @@dimensions = 2.times.map{ dimension }.join('x')
  @@game_icon_image = @@image_urls[:default]


  # GET /games
  # GET /games.json

  def index
    @games = Game.all
    @display_games = Game.all.map do |game|
      [
        game,
        @@image_urls.fetch(
        game.sport.downcase.to_sym,
        @@image_urls[:default]),
      ]
    end
    # @game_icon_image = @@game_icon_image
    @dimensions = @@dimensions
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @join_users = @game.users
  end

  # GET /games/new
  def new
    @game = Game.new

  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    respond_to do |format|
      if @game.save
        # gp = GamePlayer.new #this activates the join table we need
        # gp.user_id = @current_user.id
        # gp.game_id = @game.id
        # gp.save!
        format.html { redirect_to root_path, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def join_game
      gp = GamePlayer.new
      gp.user_id = params[:user_id]
      gp.game_id = @game.id
      gp.save!
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:location, :start, :stop, :name, :sport, :description)
    end
end
