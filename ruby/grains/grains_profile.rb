require_relative 'grains'
require 'profiler'

def functionToBeProfiled
  grains = Grains.new
  1000000.times do |i|
    result = grains.square(i%64)
  end
end

def functionToBeProfiledX
  grains = Grains.new
  1000000.times do |i|
    result = grains.squareY(i%64)
  end
end
Profiler__::start_profile
functionToBeProfiled
Profiler__::stop_profile
Profiler__::print_profile($stdout)
puts "--------------------------"
Profiler__::start_profile
functionToBeProfiledX
Profiler__::stop_profile
Profiler__::print_profile($stdout)
