class ClashRoyaleRequester
  def get(url, headers)
    HTTParty.get(url, headers: headers)
  end
end