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

    enemy.die?
  end

  def die?
    if @hp < 1
      die
    end
  end

  def is_alive?
    @alive
  end

  private
  def die
    @alive = false
    puts ""
    puts "#{@name} is die"
  end
end
