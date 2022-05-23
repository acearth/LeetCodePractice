def combination_sum(candidates, target)
  search(0, [], target, candidates)
end

def search(cur_sum, cur_combination, target, candidates)
  if cur_sum > target
    []
  elsif cur_sum == target
    [cur_combination.sort]
  else
    candidates.flat_map do |cur|
      search(cur_sum + cur, [cur] + cur_combination, target, candidates)
    end.select(&:any?).uniq
  end
end

# ar = 2, 3, 6, 7
# p combination_sum ar, 7
# ar = [8, 7, 4, 3]
# p combination_sum ar, 11
#
# ar = [2, 3, 5]
# p combination_sum(ar, 8)
