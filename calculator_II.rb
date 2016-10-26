def calculate(s)
  nums = []
  ops = []
  cur_num = -1
  s.chars.each do |ch|
    if ch.ord.between?(48, 57)
      cur_num = 0 if cur_num == -1
      cur_num = cur_num * 10 + ch.ord - 48  # ASCII code of '0' is 48
    else
      nums << cur_num if cur_num > -1
      cur_num = -1
    end
    ops << ch.to_sym if ch == '+' || ch == '-' || ch == '*' || ch == '/'
  end
  nums << cur_num if cur_num != -1
  sequential_eval(nums, ops)
end

def sequential_eval(nums, ops)
  len = ops.length
  i = 0
  result = nums.first
  while i < len
    if ops[i] == :* || ops[i] == :/ || ops[i+1] == :+ || ops[i+1] == :- || i+1 == len
      result = [result, nums[i+1]].reduce(ops[i])
      i += 1
    else
      pre_op, new_result = ops[i], nums[i+1]
      i += 1
      while ops[i] == :* || ops[i] == :/
        new_result=[new_result, nums[i+1]].reduce(ops[i])
        i += 1
      end
      result = [result, new_result].reduce(pre_op)
    end
  end
  result
end

#calculate("3+5 / 2 ") == 5 # <-- USAGE
