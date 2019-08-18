class ApplicationController < ActionController::API
  def index
    render json: {all: "ok"}, :ok
  end
end
