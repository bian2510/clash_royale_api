class ApplicationController < ActionController::API
  def index
    render json: {tournament: Tournament.first}, status: :ok
  end
end
