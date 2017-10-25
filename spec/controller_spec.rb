require 'controller'

describe Controller do
  let(:data_fetcher) { double :data_fetcher }
  let(:command) { double :command }
  subject(:controller) { described_class.new(data_fetcher: data_fetcher, command: command) }

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
    {"user_id"=>"0000-0000-0000-0002", "item"=>"Aerodynamic Copper Bench", "spend"=>"3.21"}
  ]

  before do
    allow(data_fetcher).to receive(:get_user_data)
      .and_return(user_data)
    allow(data_fetcher).to receive(:get_purchase_data)
      .and_return(purchase_data)
  end

  it 'checks user data has been loaded' do
    controller.load_data
    expect(controller.user_data).to eq user_data
  end

  it 'checks purchase data has been loaded' do
    controller.load_data
    expect(controller.purchase_data).to eq purchase_data
  end

end
