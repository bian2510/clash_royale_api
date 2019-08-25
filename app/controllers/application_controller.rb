class ApplicationController < ActionController::API
  def validation_for_create_tournaments
    keys = %W[clan_tag time_per_round players rounds]
    return render json: {error: 400}, status: :bad_request unless params[:clan_tag].present?
    validates_params(tournaments_params_create.to_h, keys)
    validate_clan_exist(tournaments_params_create[:clan_tag])
  end

  def validation_for_update_tournaments
    keys = %W[first_place second_place best_streak unbeaten]
    return render json: {error: 400}, status: :bad_request unless params[:id].present?
    validates_params(tournaments_params_update.to_h, keys)
    validate_clan_exist(params[:id])
  end

  private

  def validate_clan_exist(clan_tag)
    token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjQ5YWEwYzc3LTEyNzctNDRhZS05NmIyLTUwYzUyODE2MzIxMSIsImlhdCI6MTU2NjY4MzY2Miwic3ViIjoiZGV2ZWxvcGVyL2ZlM2VmMzYzLTBmNmYtZGE4NS0yNmE0LTIxZTk3M2E5NjQ4ZiIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxODEuNDYuMTM5LjExIl0sInR5cGUiOiJjbGllbnQifV19.pG34mGm1QwG8ZLb1LEkWSr4d7PzukJH7XQFiQhmSyb4ylAxHvMVab_HdwRr7CpI6sNOsssVVJDjVYUNXSIntog"
    url = BuilderUrl.new.get_clan(clan_tag)
    response = HTTParty.get(url, :headers => {"Authorization" => token})
    return render json: {error: "#{response.code}"}, status: :not_found if response.code != 200
    JSON.parse(response.body)
  end

  def validates_params(params_method, keys_expected)
    unless keys_expected.size == params_method.size
      return render json: {error: "bad_request"}, status: :bad_request
    end
    validate_each_param(params_method, keys_expected)
  end

  def validate_each_param(parameters, keys)
    parameters.each do |key, value|
      return render json: {error: "bad_request"}, status: :bad_request unless keys.include?(key)
    end
  end
end