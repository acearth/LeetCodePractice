# @param {Integer} n
# @return {Integer}
def num_trees(n)
  pro=(n+1..2*n).inject(:*)
  cbase=(1..n+1).inject(:*)
  return pro/cbase
end

p num_trees 5
p num_trees 3

