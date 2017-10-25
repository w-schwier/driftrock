class Controller
  attr_reader :data_fetcher, :command, :user_data, :purchase_data

  def initialize(data_fetcher: DataFetcher.new, command: Command.new)
    @command = command
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
    command = arguments[0]; user_email = arguments[1] if arguments[1]
    case command
    when "total_spend"
      self.command.total_spend(user_email)
    when "average_spend"
      self.command.average_spend(user_email)
    when "most_loyal"
      self.command.most_loyal
    when "highest_value"
      self.command.highest_value
    when "most_sold"
      self.command.most_sold
    else
      puts "Please try again with a correct command"
    end
  end
end
