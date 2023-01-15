# Q-875: binary search on left boundry
# 15/jan/2023
# Arthur An
# @param {Integer[]} piles
# @param {Integer} h
# @return {Integer}
def min_eating_speed(piles, h)
  l, r = 1, piles.max
  while l < r
    m = (l + r) / 2
    if can_eat(piles, m, h)
      r = m
    else
      l = m + 1
    end
  end
  l
end

def can_eat(piles, rate, hours)
  piles.reduce(0) { |acc, p| acc + (1.0 * p / rate).ceil } <= hours
end

piles = [3, 6, 7, 11]
h = 8
(1..piles.max).each { |pi| p "#{pi}: #{can_eat(piles, pi, h) }" }