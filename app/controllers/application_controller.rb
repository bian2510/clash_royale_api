class ApplicationController < ActionController::API
  def validation_for_create_tournaments
    return render json: {error: 400}, status: :bad_request unless tournaments_params_create[:clan_tag].present?
    validates_params_create
    validate_clan_exist
  end

  def validate_clan_exist
    token = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjQ5YWEwYzc3LTEyNzctNDRhZS05NmIyLTUwYzUyODE2MzIxMSIsImlhdCI6MTU2NjY4MzY2Miwic3ViIjoiZGV2ZWxvcGVyL2ZlM2VmMzYzLTBmNmYtZGE4NS0yNmE0LTIxZTk3M2E5NjQ4ZiIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxODEuNDYuMTM5LjExIl0sInR5cGUiOiJjbGllbnQifV19.pG34mGm1QwG8ZLb1LEkWSr4d7PzukJH7XQFiQhmSyb4ylAxHvMVab_HdwRr7CpI6sNOsssVVJDjVYUNXSIntog"
    clan_tag = tournaments_params_create[:clan_tag]
    url = BuilderUrl.new.get_clan(clan_tag)
    response = HTTParty.get(url, :headers => {"Authorization" => token})
    return render json: {error: "#{response.code}"}, status: :not_found if response.code != 200
    JSON.parse(response.body) if response.code == 200
  end

  def validates_params_create
    keys = %W[clan_tag time_per_round players rounds]
    tournaments_params_create.each do |key, value|
      return render json: {error: "bad_request"}, status: :bad_request unless keys.include?(key)
    end
  end
end