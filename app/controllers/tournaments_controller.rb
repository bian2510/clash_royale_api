class TournamentsController < ApplicationController
  before_action :validate_clan_exist, only: [:create]
  def index
    render json: Tournament.all
  end
  
  def show
    render json: Tournament.where(clan_tag: "##{normalize_clan_tag(params[:id])}")
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

  def normalize_clan_tag(clan_tag)
    normalized_clan_tag = clan_tag.upcase
  end

  def validate_clan_exist
    token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6Ijg2MDM3MGIxLTdmNmMtNDhhYS1hNTY5LTFkYzBmZDNlMDNjMiIsImlhdCI6MTU2NjMyNzU0NCwic3ViIjoiZGV2ZWxvcGVyL2ZlM2VmMzYzLTBmNmYtZGE4NS0yNmE0LTIxZTk3M2E5NjQ4ZiIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxODYuMTM5LjEwMy4xNTkiXSwidHlwZSI6ImNsaWVudCJ9XX0._zFDF4yRKar-ldxwtjI7jPaiUdgEO59-WduuzqqxqRX_l2FrhoQGknXnomCirvBmhGe-RtsiJtMCUegBFLlfqw"
    base_url = 'https://api.clashroyale.com/v1'
    clan_tag = normalize_clan_tag(tournaments_params[:clan_tag])
    path_url = "/clans/%23#{clan_tag}"
    response = HTTParty.get(base_url + path_url, :headers => {"Authorization" => token})
    return render json: {error: "Not found clan"}, status: :not_found if response.code == 404
    JSON.parse(response.body)
  end

  def tournaments_params
    params.require(:tournament).permit(:clan_tag, :time_per_round, :players, :rounds)
  end
end

