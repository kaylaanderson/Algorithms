class Videogame
  attr_accessor :console, :game

  def initialize(console, game)
    @console = console
    @game = game
  end

  def output_videogame
    puts "#{@console}, #{@game}"
  end

end

videogame = Videogame.new(:Nintendo, :Zelda)
puts videogame
videogame.output_videogame