class TournamentsController < ApplicationController
  before_action :validation_for_create_tournaments, only: [:create]
  def index
    render json: Tournament.all
  end
  
  def show
    render json: Tournament.where(clan_tag: "##{params[:id]}")
  end

  def create
    tournament = Tournament.new(tournaments_params_create)
    if tournament.save
      render json: tournament, status: :created
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render json: {error: "the tournament can't be created"}, status: :unprocessable_entity
    end
  end

  private

  def tournaments_params_create
    params.require(:tournament).permit(:clan_tag, :time_per_round, :players, :rounds)
  end
end

