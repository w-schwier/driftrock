require 'httparty'

class DataFetcher

  def get_user_data
    fetch_data("users")
  end

  def get_purchase_data
    fetch_data("purchases")
  end

  private

  def fetch_data(type)
    page = 1
    data = []
    until @enteries == [] do
      url = "https://driftrock-dev-test-2.herokuapp.com/#{type}?page=#{page}&per_page=2000"; response = HTTParty.get(url); @enteries = response.parsed_response['data']
      data += @enteries
      page +=1
    end
    @enteries = "reset"
    data
  end
end
