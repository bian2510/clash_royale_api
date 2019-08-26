class Builder
  def initialize
    @base_url = 'https://api.clashroyale.com/v1'
  end


  def url_get_clan(clan_tag)
    @base_url + '/clans/%23' + clan_tag
  end
  def headers
    {"Authorization": "Bearer #{ENV["API_KEY_SUPERCELL"]}"}
  end
end