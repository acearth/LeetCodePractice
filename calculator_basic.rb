def calculate(s)
  nums = [[]]
  ops = [[]]
  cur_num = -1
  s.chars.each do |ch|
    if ch.ord.between?(48, 57)
      cur_num = 0 if cur_num == -1
      cur_num = cur_num * 10 + ch.ord - 48 # ASCII code of '0' is 48
    else
      nums.last << cur_num if cur_num > -1
      cur_num = -1
    end
    process_current(ch, nums, ops)
  end
  nums.last << cur_num if cur_num != -1
  seq_eval(nums.pop, ops.pop)
end

def process_current(ch, nums_stack, operator_stack)
  if ch == '('
    nums_stack << []
    operator_stack << []
  elsif ch == ')'
    current = seq_eval(nums_stack.pop, operator_stack.pop)
    nums_stack.last << current
  elsif ch == '+' || ch == '-'
    operator_stack.last << ch.to_sym
  end
end

def seq_eval(nums, ops)
  result = nums.first
  ops.length.times { |i| result = [result, nums[i + 1]].reduce(ops[i]) }
  result
end

# p calculate("(1+(4+5+2)-3)+(6+8)") == 23
