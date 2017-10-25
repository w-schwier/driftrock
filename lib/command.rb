class Command
  attr_reader :user_email, :user_id,

  def initialize(user_calculator: UserCalculator.new, purchase_calculator: PurchaseCalculator.new)
    @user_email = nil
    @user_id = nil
    @user_calculator = user_calculator
    @purchase_calculator = purchase_calculator
  end

  def total_spend(user_email)
    @user_email = user_email

  end

  def average_spend(user_email)
    @user_email = user_email
  end

  def most_loyal

  end

  def highest_value

  end

  def most_sold

  end

end
