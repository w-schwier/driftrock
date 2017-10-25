require_relative 'lib/data_fetcher'
require_relative 'lib/user_calculator'
require_relative 'lib/purchase_calculator'
require_relative 'lib/command'
require_relative 'lib/controller'

controller = Controller.new
controller.run(ARGV)
