class Hero
  #class will help us ID the hero and allow
  #us to assign special moves later on for that specific hero
  def initialize(args, hero_class, is_active, name, health, attack_power, defense, sprite)
    @args = args
    @outputs = args.outputs
    @hero_class = hero_class
    @is_active = is_active
    @name = name
    @currentHealth = health
    @maxHealth = health
    @attack_power = attack_power
    @defense = defense
    @sprite = sprite
  end

  #render the hero
  def render
    @outputs.primitives << @sprite.solid!
  end

  #attack method

  #defend method

  #if active hero, mess with menu wheel

  #if active, able to deactive and set a different hero as active
  


end