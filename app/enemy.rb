class Enemy
  #Need to define the enemies name, health, amount, defense and 
  #differing attack powers for different attack types
  #attack_power will be an array, typically bosses will have a special attack
  def initialize(args, name, health, attack_power, defense, sprite)
    @args = args
    @outputs = args.outputs
    @name = name
    @currentHealth = health
    @maxHealth = health
    @attack_power = attack_power
    @defense = defense
    @sprite = sprite
  end

  #render the enemy
  def render
    @outputs.primitives << @sprite.solid
  end

  #attack method

end