# frozen_string_literal: true

class GamesController < ApplicationController
  before_action :set_game, only: %i[show update destroy]

  # GET /games
  def index
    @games = Game.all.order(created_at: :desc)
    render json: GameSerializer.new(@games)
  end

  # GET /games/1
  def show
    render json: GameSerializer.new(@game)
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: GameSerializer.new(@game), status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      render json: GameSerializer.new(@game)
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:data).require(:attributes).permit(:winner_id, :move_count, :turn,
                                                      player1_moves: [], player2_moves: [])
  end
end
