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
