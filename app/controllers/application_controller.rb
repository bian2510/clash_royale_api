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
    builder = Builder.new
    response = ClashRoyaleRequester.get(builder.url_get_clan(clan_tag),
                                        builder.headers)
    if response.code != 200
      render json: { error: response.code.to_s }, status: :not_found
    end
    JSON.parse(response.body)
  end

  def validates_params(params_method, keys_expected)
    unless keys_expected.size == params_method.size
      render json: {error: "bad_request"}, status: :bad_request
    end
    validate_each_param(params_method, keys_expected)
  end

  def validate_each_param(parameters, keys)
    parameters.each do |key, value|
      render json: {error: "bad_request"}, status: :bad_request unless keys.include?(key)
    end
  end
end