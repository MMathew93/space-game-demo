require 'app/main_menu.rb'
require 'app/battle_scene.rb'

class SpaceGame
  #Set up State
  def initialize(args)
    @args = args
    @main_menu = Menu.new(args)
    @game = Battle_Scene.new(args)
  end

  #This function is called in Main and begins the whole thang
  def tick
    render
    #calc
    process_inputs
  end

  def render
    #outputs.sounds << "sounds/flappy-song.ogg" if state.tick_count == 1
    render_main_menu
    render_game
  end

  def render_main_menu
    return unless @args.state.scene == :menu
    @main_menu.render
  end

  def render_game
    return unless @args.state.scene == :game
    #Render all the items from the game file
    #this includes the background, heroes and enemies
    @game.render
  end

  def process_inputs
    @main_menu.process_inputs
    #@game.process_inputs
  end

end

#CALL THIS TO START
def tick(args)
  args.state.difficulty ||= :normal
  args.state.new_difficulty ||= :normal
  args.state.scene ||= :menu
  
  args.state.game ||= SpaceGame.new(args)
  args.state.game.tick
end