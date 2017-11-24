require "./hero"
require "./holy_knight"
require "./magician"
require "./monster"

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
