class TournamentsController < ApplicationController
  before_action :validate_clan_exist, only: [:create]
  def index
    render json: Tournament.all
  end
  
  def show
    render json: Tournament.where(clan_tag: "##{params[:id]}")
  end

  def create
    tournament = Tournament.new(tournaments_params)
    if tournament.save
      render json: tournament, status: :created
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render json: {error: "the tournament can't be created"}, status: :unprocessable_entity
    end
  end

  def update
    tournament = Tournament.where(clan_tag: "##{params[:id]}").last
    if tournament.update(tournaments_params_update)
      render json: tournament, status: :ok
    else
      render json: {error: "the tournament can't be edited"}, status: :not_acceptable
    end
  end

  private

  def tournaments_params_create
    params.require(:tournament).permit(:clan_tag, :time_per_round, :players, :rounds)
  end

  def tournaments_params_update
    params.require(:tournament).permit(:first_place, :second_place, :best_streak, :unbeaten)
  end
end

