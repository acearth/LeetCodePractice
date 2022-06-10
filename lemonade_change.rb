# Q-860: change money, easy greeding
def lemonade_change(bills)
  has = { 5 => 0, 10 => 0, 20 => 0 }
  bills.each do |b|
    has[b] += 1
    change = b - 5
    while change >= 10 && has[10] > 0
      change -= 10
      has[10] -= 1
    end
    while change >= 5 && has[5] > 0
      change -= 5
      has[5] -= 1
    end
    return false if change > 0
  end
  true
end
