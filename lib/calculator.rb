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
    puts "Calulating most loyal"
    get_highest('user_id', data)
  end

  def highest_value(data)
    puts 'Calculating highest value'
    ids = data.map {|item| item['user_id']}.uniq
    puts 'ids done'
    arr = []
    ids.each { |id| arr.push(id => total_spend(id, data)) }
    puts 'got id => total spend'
    arr.max_by{|k,v| v}.keys.pop
  end

  def most_sold(data)
    puts "Calulating most sold"
    get_highest('item', data)
  end

  private

  def get_total(id, data)
    @total = 0
    @count = 0
    data.each { |item| (@total += item['spend'].to_f) && (@count += 1) if item['user_id'] == id }
  end

  def get_highest(type, data)
    arr = data.map {|item| item[type]}
    arr.group_by{|i| i}.max{|x,y| x[1].length <=> y[1].length}[0]
  end
end
