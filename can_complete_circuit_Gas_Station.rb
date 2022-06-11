# Q-134: solution before 2018
def can_complete_circuit(gas, cost)
  due = remain = start = 0
  gas.size.times do |location|
    remain += gas[location] - cost[location]
    next unless remain < 0
    due, remain = due + remain, 0
    start = location + 1
  end
  remain + due < 0 ? -1 : start
end


# solution on 2022
def can_complete_circuit(gas, cost)
  p net = gas.zip(cost).map { |i| i.reduce(:-) }
  remain = 0
  location = 0
  net.each_with_index do |have, i|
    if remain + have < 0
      location = i + 1
      remain = 0
    else
      remain += have
    end
  end
  return -1 if location == net.size || net.sum < 0
  location
end