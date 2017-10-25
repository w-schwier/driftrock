class Calculator

  def total_spend(id, data)
    get_total(id, data)
    "£%.2f" % @total
  end

  def average_spend(id, data)
    get_total(id, data)
    "£%.2f" % ((@total)/(@count))
  end

  def most_loyal(data)
    return id

  end

  def highest_value(data)
    return id

  end

  def most_sold(data)
    return name

  end

  private

  def get_total(id, data)
    @total = 0
    @count = 0
    data.each { |item| (@total += item['spend'].to_f) && (@count += 1) if item['user_id'] == id }
  end


end
