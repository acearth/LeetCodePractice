# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  search([], target, 0, candidates.sort)
end

def search(comb, remain, cur, candidates)
  if remain == 0
    [comb]
  elsif remain < 0
    []
  else
    (cur...candidates.size).flat_map do |next_cur|
      next [] if next_cur > cur && candidates[next_cur] == candidates[next_cur - 1] #important optimization
      search(comb + [candidates[next_cur]], remain - candidates[next_cur], next_cur + 1, candidates)
    end.select(&:any?)
  end
end