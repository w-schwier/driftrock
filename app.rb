require_relative 'lib/data_fetcher'
require_relative 'lib/calculator'
require_relative 'lib/controller'

controller = Controller.new
controller.run(ARGV)
