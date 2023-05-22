require_relative './classes/app'
require_relative './modules/options'
require_relative './modules/presentations'
require_relative './modules/ui_methods'

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
      options_input @app
    end
  end
end

main = Main.new
main.run
