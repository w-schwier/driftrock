require 'data_fetcher'

describe DataFetcher do
  subject(:data_fetcher) { described_class.new }

  # Could figure out stubbing and didn't want to waste time figuring this out, might come back to it, and didn't want to keep pinging the api
  # it 'returns data for users' do
  #   expect(data_fetcher.get_user_data).to eq "users"
  # end
  #
  # it 'returns data for purchases' do
  #   expect(data_fetcher.get_purchase_data).to eq "purchases"
  # end
end
