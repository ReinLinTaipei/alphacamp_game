require "./hero"

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

    enemy.die?
  end

end
