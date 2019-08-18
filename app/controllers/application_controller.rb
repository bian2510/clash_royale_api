class ApplicationController < ActionController::API
  def index
    render json: {all: "ok"}, status: :ok
  end
end
