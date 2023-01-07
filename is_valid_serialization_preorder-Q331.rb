# Q-331: original stack analogy
# 21/dec/2022
# @param {String} preorder
# @return {Boolean}
def is_valid_serialization(preorder)
  pres = preorder.split(",")
  stack = [[]]
  top = stack.last
  tops = []
  pres.each do |c|
    if c == '#'
      top << c
    else
      top << [c]
      tops << top
      top = top[-1]
    end
    while tops.last && top.size == 3 && top[1] == '#' && top[2] == '#'
      tops.last.pop
      tops.last << '#'
      top = tops.pop
    end
  end
  stack == [['#']]
end

# Graph solution on in / out degree
def is_valid_serialization(preorder)
  degrees = 1
  preorder.split(",").each do |node|
    degrees -= 1
    return false if degrees < 0
    degrees += 2 if node != '#'
  end
  degrees == 0
end
