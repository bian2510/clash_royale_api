class TournamentsController < ApplicationController
  def index
    render json: Tournament.all
  end
  
  def show
    render json: Tournament.find_by(clan_tag: '#VP08QJV')
  end
end