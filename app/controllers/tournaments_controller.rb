class TournamentsController < ApplicationController
  def index
    render json: Tournament.all
  end
  
  def show
    render json: Tournament.where(clan_tag: "##{normalize_clan_tag}")
  end

  private

  def normalize_clan_tag
    clan_tag_up_case = params[:id].upcase
    normalize_clan_tag = clan_tag_up_case.gsub('*', '') if clan_tag_up_case.include? '*'
    normalize_clan_tag = clan_tag_upcase
  end

  def tournaments_params
    params.require(:tournament).permit!(:clan_tag, :limit_time)
  end
end