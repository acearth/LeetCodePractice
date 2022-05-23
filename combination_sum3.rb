# comb sum 3: backtracking
# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}
def combination_sum3(k, n)
  search(0,[],(1..9).to_a,k,n)
end

def search(cur_sum,cur_combination, candidates, k,target)
  if  k < 0 || cur_sum > target
    []
  elsif k == 0
    cur_sum == target ? [cur_combination.sort] : []
  else
    candidates.flat_map do |cur|
      search(cur_sum + cur, [cur]+ cur_combination, candidates - [cur],k-1, target)
    end.uniq
  end
end