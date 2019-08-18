class ApplicationController < ActionController::API
  def index
    render json: Tournament.all, status: :ok
  end
end
