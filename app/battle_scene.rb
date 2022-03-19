class Battle_Scene

  def initialize(args)
    @args = args
    @outputs = args.outputs
    @difficulty = args.state.difficulty
    @new_difficulty = args.state.new_difficulty
    @scene = args.state.scene
    @inputs = args.inputs
  end

  def render
    render_background
    #render_heroes
    #render_enemies
  end

  def render_background
    @outputs.primitives << { x: 0, y: 0, w: 1280, h: 720 }
    @outputs.labels << { x: 10, y: 100, text: "HELLO" }
  end
end