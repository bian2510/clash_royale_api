class TournamentsController < ApplicationController
  def index
    render json: Tournament.all
  end
  
  def show
    render json: Tournament.where(clan_tag: "##{normalize_clan_tag}")
  end

  def create
    if validate_clan_exist != nil
      tournament = Tournament.new(tournaments_params)
      if tournament.save
        render json: tournament, status: :created
      else
        # This line overrides the default rendering behavior, which
        # would have been to render the "create" view.
        render json: {error: "the tournament can't be created"}, status: :unprocessable_entity
      end
    end
  end

  private

  def normalize_clan_tag
    clan_tag_up_case = params[:id].upcase
    normalize_clan_tag = clan_tag_up_case.gsub('*', '') if clan_tag_up_case.include? '*'
    normalize_clan_tag = clan_tag_up_case
  end

  def validate_clan_exist
    token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjM5ODQ1ODhlLWFlZDMtNDZmYi1iZWZkLWNmYTFmNmMwMmI5ZCIsImlhdCI6MTU2NjA4MzgwMiwic3ViIjoiZGV2ZWxvcGVyL2ZlM2VmMzYzLTBmNmYtZGE4NS0yNmE0LTIxZTk3M2E5NjQ4ZiIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxODEuNDYuMTM5LjExIl0sInR5cGUiOiJjbGllbnQifV19.NKx1O_aqZRea5_CrwrOZTo1p0HTLdG0eaDuR30UN9TwQhhg1M1Umxt7Za4S_dZhtSzzRmD08XZv3tcQ6Jwz-cA"
    base_url = 'https://api.clashroyale.com/v1'
    clan_tag = tournaments_params[:clan_tag].gsub('#','')
    get_clan = "/clans/%23#{clan_tag}"
    response = HTTParty.get(base_url + get_clan, :headers => {"Authorization" => token})
  end

  def tournaments_params
    params.require(:tournament).permit(:clan_tag, :time_per_round, :players, :rounds)
  end
end

