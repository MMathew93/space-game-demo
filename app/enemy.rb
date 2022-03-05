class Enemy
  #we'll want to define if the enemy is a boss
  #it's name, health amount, defense and 
  #differing attack powers for different attack types
  #attack_power will be an array, typically bosses will have a special attack
  def initialize(is_boss, name, health, attack_power, defense, sprite)
    @is_boss = is_boss
    @name = name
    @health = health
    @attack_power = attack_power
    @defense = defense
    @sprite = sprite
  end


end