class Controller
  attr_reader :data_fetcher, :calculator, :user_data, :purchase_data, :user_id, :user_email

  def initialize(data_fetcher: DataFetcher.new, calculator: Calculator.new)
    @data_fetcher = data_fetcher
    @calculator = calculator
  end

  def load_data
    puts "Loading User Data"
    @user_data = self.data_fetcher.get_user_data
    puts "Loading Purchase Data"
    @purchase_data = self.data_fetcher.get_purchase_data
  end

  def run(arguments)
    load_data
    command = arguments[0]; set_user_info(arguments[1]) if arguments[1]
    case command
    when "total_spend"
      puts_and_return(@calculator.total_spend(@user_id, @purchase_data))
    when "average_spend"
      puts_and_return(@calculator.average_spend(@user_id, @purchase_data))
    when "most_loyal"
      id = @calculator.most_loyal(@purchase_data)
      puts_and_return(get_user_email(id))
    when "highest_value"
      puts_and_return(get_user_email(@calculator.highest_value(@purchase_data)))
    when "most_sold"
      puts_and_return(@calculator.most_sold(@purchase_data))
    else
      puts "Please try again with a correct command..."
    end
  end

  private

  def puts_and_return(answer)
    puts answer; answer
  end

  def set_user_info(email)
    @user_email = email
    user_data.each { |user| @user_id = user['id'] if user['email'] == @user_email }
  end

  def get_user_email(id)
    user_data.each { |user| return user['email'] if user['id'] == id }
  end
end
