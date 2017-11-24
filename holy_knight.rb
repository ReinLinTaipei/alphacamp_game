require "./hero"

class HolyKnight < Hero

  def attack(enemy)
    damage = rand(@ap..@ap*2)
    enemy.hp = enemy.hp - damage

    puts "\n====="
    puts "#{@name} hp: #{@hp}"
    puts "#{@name} shine the light: #{damage} damage"
    puts "#{enemy.name} hp is: #{enemy.hp}"

    enemy.die?
  end

end
