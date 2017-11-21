
class Monster
  attr_accessor :name, :hp

  def initialize(name, hp, ap)
    @name = name
    @hp   = hp
    @ap   = ap
    @alive = true
  end

  def attack(enemy)
    damage = rand(@ap/2..@ap)
    enemy.hp = enemy.hp - damage

    puts "\n======="
    puts "#{@name} hp: #{@hp}"
    puts "#{@name} attack: #{damage} damage"
    puts "#{enemy.name} hp is: #{enemy.hp}"

    if enemy.hp < 1
      enemy.die
    end
  end

  def is_alive?
    @alive
  end

  def die
    @alive = false
    puts ""
    puts "#{@name} is die"
  end
end

class Hero < Monster
  @@heroes = []

  def initialize(name, hp, ap)
    super
    @@heroes << self
  end

  def self.all
    return @@heroes
  end

  def die
    super
    @@heroes.delete(self)
  end
end

class HolyKnight < Hero

  def attack(enemy)
    damage = rand(@ap..@ap*2)
    enemy.hp = enemy.hp - damage

    puts "\n====="
    puts "#{@name} hp: #{@hp}"
    puts "#{@name} shine the light: #{damage} damage"
    puts "#{enemy.name} hp is: #{enemy.hp}"

    if(enemy.hp < 1)
      enemy.die
    end
  end

end

class Magician < Hero

  attr_accessor :mp

  def initialize(name, hp, ap, mp)
    super(name, hp, ap)
    @mp = mp
  end

  def attack(enemy)
    if(mp > 3)
      fireball(enemy)
    else
      super(enemy)
    end
  end

  private
  def fireball(enemy)
    damage = 3*rand(5..5+@mp/3)
    cost  = damage / 3
    @mp = @mp - cost
    if(@mp < 3)
      attack(enemy)
      return
    end
    enemy.hp = enemy.hp - damage

    puts "\n======="
    puts "#{name} hp: #{@hp}"
    puts "#{name} fire #{damage} damage"
    puts "#{enemy.name} hp is #{enemy.hp}"
    puts "#{name} mp is #{mp}"

    if(enemy.hp < 1)
      enemy.die
    end
  end

end

###

Hero.new("Robinhan", 100, 10)
HolyKnight.new("Lanister", 120, 15)
Magician.new("Melin", 80, 10, 42)
monster = Monster.new("Dragan", 300, 60)
team = Hero.all

team.each do |hero|
  puts "#{hero.name} is #{hero.class}"
end

while team.length > 0 && monster.is_alive?

  team.each do |hero|
    hero.attack(monster)
    if !monster.is_alive?
      break;
    end
  end

  if !monster.is_alive?
    break;
  end

  monster.attack(team[rand(0..team.length-1)])
  team = Hero.all
end

puts "\n======"
if team.length == 0
  puts "#{monster.name} win!"
else
  team.each do |hero|
    puts "#{hero.name} is alive, hp: #{hero.hp}"
  end
end
