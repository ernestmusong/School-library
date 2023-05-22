require './classes/app'
require './modules/ui_methods'
require './modules/options'
require './modules/presentations'

class Main
  include Options
  extend Presentations
  include UI

  def initialize
    @app = App.new
  end

  presentations

  def run
    loop do
      options
      options_input
    end
  end
end

main = Main.new
main.run
