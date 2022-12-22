# frozen_string_literal: true

class WinningNumbersController < ApplicationController
  before_action :set_winning_number, only: %i[show update destroy]

  # GET /winning_numbers
  def index
    @winning_numbers = WinningNumber.all

    render json: WinningNumbersSerializer.new(@winning_numbers)
  end

  # GET /winning_numbers/1
  def show
    render json: WinningNumbersSerializer.new(@winning_number)
  end

  # POST /winning_numbers
  def create
    @winning_number = WinningNumber.new(winning_number_params)

    if @winning_number.save
      render json: WinningNumbersSerializer.new(@winning_number), status: :created,
             location: @winning_number
    else
      render json: @winning_number.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /winning_numbers/1
  def update
    if @winning_number.update(winning_number_params)
      render json: WinningNumbersSerializer.new(@winning_number)
    else
      render json: @winning_number.errors, status: :unprocessable_entity
    end
  end

  # DELETE /winning_numbers/1
  def destroy
    @winning_number.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_winning_number
    @winning_number = WinningNumber.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def winning_number_params
    params.require(:data).require(:attributes).permit(%i[numbers])
  end
end
