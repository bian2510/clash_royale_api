class ApplicationController < ActionController::API
  def validation_for_create_tournaments
    keys = %w[clan_tag time_per_round players rounds]
    unless params[:clan_tag].present?
      return render json: { error: 400 }, status: :bad_request
    end

    validates_params(tournaments_params_create.to_h, keys)
    validate_clan_exist(tournaments_params_create[:clan_tag])
  end

  def validation_for_update_tournaments
    keys = %w[first_place second_place best_streak unbeaten]
    unless params[:id].present?
      return render json: { error: 400 }, status: :bad_request
    end

    validates_params(tournaments_params_update.to_h, keys)
    validate_clan_exist(params[:id])
  end

  private

  def validate_clan_exist(clan_tag)
    response = HTTParty.get(Builder.new.url_get_clan(clan_tag),
                            headers: Builder.new.headers)
    if response.code != 200
      render json: { error: response.code.to_s }, status: :not_found
    end
    JSON.parse(response.body)
  end

  def validates_params(params_method, keys_expected)
    unless keys_expected.size == params_method.size
      render json: { error: 'bad_request' }, status: :bad_request
    end
    validate_each_param(params_method, keys_expected)
  end

  def validate_each_param(parameters, keys)
    parameters.each do |key, _value|
      unless keys.include?(key)
        render json: { error: 'bad_request' }, status: :bad_request
      end
    end
  end
end