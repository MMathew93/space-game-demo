require 'app/hero.rb'
require 'app/enemy.rb'

class Battle_Scene

  def initialize(args)
    @args = args
    @outputs = args.outputs
    @inputs = args.inputs
  end

  def render
    render_background
    create_heroes
    create_enemies
  end

  def render_background
    @outputs.primitives << {x: 0, 
                            y: 0, 
                            w: 1280, 
                            h: 720,
                            r: 255, g: 255, b: 255}.solid!
    @outputs.primitives << {x: 0, 
                            y: 0, 
                            w: 1280, 
                            h: 100, 
                            r: 0, g: 0, b: 0}.solid!
  end

  def create_heroes
    return unless @args.state.scene == :game

    case @args.state.difficulty
    when :normal
      @strHero = Hero.new(@args, "tanker", false, "Titania", 15, 1, 3, {x: 330, y: 100, w: 100, h: 100, r: 255, g: 0, b: 0})
      @dexHero = Hero.new(@args, "ranger", false, "Robut", 10, 2, 2, {x: 70, y: 100, w: 100, h: 100, r: 0, g: 255, b: 0})
      @intHero = Hero.new(@args, "wizard", true, "Wizkid", 5, 3, 1, {x: 200, y: 100, w: 100, h: 100, r: 0, g: 0, b: 255})
    when :hard
      @strHero = Hero.new(@args, "tanker", false, "Titania", 1, 1, 0, {x: 330, y: 100, w: 100, h: 100, r: 255, g: 0, b: 0})
      @dexHero = Hero.new(@args, "ranger", false, "Robut", 1, 1, 0, {x: 70, y: 100, w: 100, h: 100, r: 0, g: 255, b: 0})
      @intHero = Hero.new(@args, "wizard", true, "Wizkid", 1, 1, 0, {x: 200, y: 100, w: 100, h: 100, r: 0, g: 0, b: 255})
    end

    render_heroes
  end

  def render_heroes
    @strHero.render
    @dexHero.render
    @intHero.render
  end

  def create_enemies
    return unless @args.state.scene == :game

    case @args.state.difficulty
    when :normal
      @enemy = [
                Enemy.new(@args, "UFO", 10, 2, 3, {x: 830, y: 100, w: 100, h: 100, r: 200, g: 100, b: 200}),
                Enemy.new(@args, "ALIEN", 15, 2, 2, {x: 970, y: 100, w: 100, h: 100, r: 100, g: 200, b: 100}),
                Enemy.new(@args, "UFO", 10, 2, 3, {x: 1100, y: 100, w: 100, h: 100, r: 200, g: 100, b: 200})
              ]
    when :hard
      @enemy = [Enemy.new(@args, "BIG BOSS", 25, 3, 1, {x: 870, y: 100, w: 300, h: 300, r: 155, g: 150, b: 155})]
    end

    render_enemies
  end

  def render_enemies
    return unless @args.state.scene == :game
    @enemy.map {|enemy| enemy.render}
  end

end