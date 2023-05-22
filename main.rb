require_relative './classes/app'
require_relative './modules/UIMethods'
require_relative './modules/options'
require_relative './modules/presentations'

class Main
  include Options
  include Presentations
  include UIMethods
  
  def initialize
    @app = App.new
  end

  presentations
  
  def run
    loop do
      options
      get_options

    end
  end
end

main = Main.new
main.run
