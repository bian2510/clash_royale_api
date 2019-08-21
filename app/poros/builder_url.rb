class BuilderUrl
  def initialize
    @base_url = 'https://api.clashroyale.com/v1'
  end
  def get_clan(clan_tag)
    @base_url + '/clans/%23' + clan_tag
  end
end