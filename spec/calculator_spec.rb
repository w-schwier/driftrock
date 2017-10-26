require 'calculator'

describe Calculator do
  subject(:calculator) { described_class.new }
  user_data = [
    {"id"=>"0000-0000-0000-0000", "first_name"=>"Quincy", "last_name"=>"Schimmel", "phone"=>"186.301.6921 x948", "email"=>"schimmel_quincy@ernser.io"},
    {"id"=>"0000-0000-0000-0001", "first_name"=>"Henry", "last_name"=>"Terry", "phone"=>"636-387-6074 x690", "email"=>"terry_henry@doyle.io"},
    {"id"=>"0000-0000-0000-0002", "first_name"=>"Tierra", "last_name"=>"Langosh", "phone"=>"570-113-3234 x7287", "email"=>"langosh.tierra@erdman.co"},
    {"id"=>"0000-0000-0000-0003", "first_name"=>"Jack", "last_name"=>"Lakin", "phone"=>"(620) 104-0175", "email"=>"jack_lakin@rodriguezschuppe.io"},
    {"id"=>"0000-0000-0000-0004", "first_name"=>"Keaton", "last_name"=>"Bahringer", "phone"=>"121-798-7807 x196", "email"=>"keaton.bahringer@moriettedicki.net"},
    {"id"=>"0000-0000-0000-0005", "first_name"=>"Eliseo", "last_name"=>"Zieme", "phone"=>"516.943.5559 x15170", "email"=>"eliseo.zieme@bosco.info"}
  ]
  purchase_data = [
    {"user_id"=>"0000-0000-0000-0000", "item"=>"example 1", "spend"=>"27.78"},
    {"user_id"=>"0000-0000-0000-0000", "item"=>"example 2", "spend"=>"54.5"},
    {"user_id"=>"0000-0000-0000-0000", "item"=>"example 3", "spend"=>"27.78"},
    {"user_id"=>"0000-0000-0000-0001", "item"=>"example 4", "spend"=>"54.5"},
    {"user_id"=>"0000-0000-0000-0002", "item"=>"example 4", "spend"=>"3.21"}
  ]
  it 'checks the right total spend is calculated' do
    expect(calculator.total_spend("0000-0000-0000-0000", purchase_data)).to eq "£110.06"
  end

  it 'checks the correct average spend is calculated' do
    expect(calculator.average_spend("0000-0000-0000-0000", purchase_data)).to eq "£36.69"
  end

  it 'checks correct user id is returned for most loyal' do #id is changed into email and returned in controller
    expect(calculator.most_loyal(purchase_data)).to eq "0000-0000-0000-0000"
  end

  it 'checks the correct highest value id is returned' do
    expect(calculator.highest_value(purchase_data)).to eq "0000-0000-0000-0000"
  end

  it 'checks correct most sold item is returned' do #id is changed into email and returned in controller
    expect(calculator.most_sold(purchase_data)).to eq "example 4"
  end
end
