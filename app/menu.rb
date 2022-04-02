class Menu
  def initialize(args)
    @args = args
    @inputs = args.inputs
    @outputs = args.outputs
    @grid = args.grid
  end

  def white
    { r: 255, g: 255, b: 255 }
  end

  def render
    render_overlay

    @outputs.labels << { x: 640, y: 700, text: "WiP Space GAME", size_enum: 50, alignment_enum: 1, **white }
    @outputs.labels << { x: 640, y: 500, text: "Instructions: Press Spacebar to start.", size_enum: 4, alignment_enum: 1, **white }
    @outputs.labels << { x: 430, y: 430, text: "[Tab]    Change difficulty", size_enum: 4, alignment_enum: 0, **white }
    @outputs.labels << { x: 430, y: 400, text: "[Enter]  Start at New Difficulty ", size_enum: 4, alignment_enum: 0, **white }
    @outputs.labels << { x: 430, y: 370, text: "[Escape] Cancel/Resume ", size_enum: 4, alignment_enum: 0, **white }
    @outputs.labels << { x: 640, y: 300, text: "(Best played with a game controller!) ", size_enum: 4, alignment_enum: 1, **white }
    @outputs.labels << { x: 640, y: 200, text: "Difficulty: #{@args.state.new_difficulty}", size_enum: 4, alignment_enum: 1, **white }

    @outputs.labels << { x: 10, y: 100, text: "Code:   @MMathew93",     **white }
    @outputs.labels << { x: 10, y:  80, text: "Art:    @Eva_Trujillo",     **white }
    @outputs.labels << { x: 10, y:  60, text: "Music:  @MMathew93",     **white }
    @outputs.labels << { x: 10, y:  40, text: "Engine: DragonRuby GTK", **white }
  end

  def render_overlay
    overlay_grid = @grid.rect.scale_rect(1.1, 0, 0)
    @outputs.primitives << { x: overlay_grid.x,
                            y: overlay_grid.y,
                            w: overlay_grid.w,
                            h: overlay_grid.h,
                            r: 0, g: 0, b: 0, a: 230 }.solid!
  end

  def process_inputs
    return unless @args.state.scene == :menu
    #do menu inputs like difficulty, moving cursor, etc
    changediff = @inputs.keyboard.key_down.tab

    if changediff
      case @args.state.new_difficulty
      when :normal
        @args.state.new_difficulty = :hard
      when :hard
        @args.state.new_difficulty = :normal
      end
    end

    if @inputs.keyboard.key_down.enter
      @args.state.difficulty = @args.state.new_difficulty
      #start game stuff
      change_to_scene(:game)
    end
    
  end

  def change_to_scene(scene)
    @args.state.scene = scene
    #state.scene_at = state.tick_count
    @inputs.keyboard.clear
    ##inputs.controller_one.clear
  end
end