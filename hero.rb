require "./monster.rb"

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
