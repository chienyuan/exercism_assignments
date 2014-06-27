

class Robot
  attr_reader :name
  @@used = {}
  def initialize
    reset
  end

  def reset
    @name = (0..1).map { (65 + rand(26)).chr}.join + rand(1000).to_s.rjust(3,'0')
    @@used[@name] = true
  end

end
