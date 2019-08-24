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

  private

  def validate_clan_exist
    token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjM4MGI4MTg2LWZhMzgtNDkwZC05ZDk1LTEzODk5ZTkyZjkyMCIsImlhdCI6MTU2NjY3NzExNiwic3ViIjoiZGV2ZWxvcGVyL2ZlM2VmMzYzLTBmNmYtZGE4NS0yNmE0LTIxZTk3M2E5NjQ4ZiIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyI1NC4yMTAuMzUuMTI1Il0sInR5cGUiOiJjbGllbnQifV19.Gyt3RoIcuXoTUiEwIk5DBJsVJAbfz_3ZY0WJ8rLKuqogLeehHS1htL7fd8pbefPil-y9ocMnsMin-UjrzSJLeg"
    clan_tag = tournaments_params[:clan_tag]
    url = BuilderUrl.new.get_clan(clan_tag)
    response = HTTParty.get(url, :headers => {"Authorization" => token})
    return render json: response
    #return render json: {error: "#{response.code}"}, status: :not_found if response.code != 200
    #JSON.parse(response.body) if response.code == 200
  end

  def tournaments_params
    params.require(:tournament).permit(:clan_tag, :time_per_round, :players, :rounds)
  end
end

