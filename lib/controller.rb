class Controller
  attr_reader :data_fetcher, :user_data, :purchase_data

  def initialize(data_fetcher: DataFetcher.new)
    @data_fetcher = data_fetcher
    @user_data = []
    @purchase_data = []

  end

  def load_data
    @user_data = self.data_fetcher.get_user_data
    @purchase_data = self.data_fetcher.get_purchase_data
  end

  def run(arguments)
    load_data
    case arguments[0]
    when "total_spend"

    when "average_spend"

    when "most_loyal"

    when "highest_value"

    when "most_sold"

    else

    end
  end
end
