class ClashRoyaleRequester
  def get_clan(url, headers)
    HTTParty.get(url, headers: headers)
  end
end
