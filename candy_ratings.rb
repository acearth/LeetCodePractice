def candy(ratings)
  return ratings.size if ratings.size < 2
  result = candy = 1
  pre_rating, len = ratings.shift, 1 ## shift: shift out one element
  ratings.each do |cur_rating|
    t = cur_rating <=> pre_rating
    pre_rating = cur_rating
    if t >= 0
      if len > 1
        len -= 1 if candy > 1
        result -= len * (candy - 1)
        len = candy = 1
      end
      candy = t == 0 ? 1 : (candy + 1)
    else # if pre > cur
    len += 1
      candy -= 1
    end
    result += candy
  end
  if len > 1
    len -= 1 if candy > 1
    result -= len * (candy - 1)
  end
  result
end

p candy([5, 3, 1]) == 6
p candy([8, 7, 6, 1, 4, 5, 6]) == 19
p candy([1, 2, 5, 9, 8, 7, 6, 1, 4, 5, 6]) == 30
p candy([1, 2, 2]) == 4
p candy([2, 1]) == 3

# Q-135: candy assignment by greeding and array
def candy_greeding(ratings)
  assigns = [1] * ratings.size
  (1...ratings.size).each { |i| assigns[i] = assigns[i - 1] + 1 if ratings[i] > ratings[i - 1] }
  (ratings.size - 2).downto(0).each { |i| assigns[i] = [assigns[i], assigns[i + 1] + 1].max if ratings[i] > ratings[i + 1] }
  assigns.sum
end
