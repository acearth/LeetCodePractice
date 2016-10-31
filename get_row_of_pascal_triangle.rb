def get_row(index)
  (0..index).to_a.map { |i| ((index - i + 1..index).to_a.inject(:*) || 1) / ((2..i).to_a.inject(:*) || 1) } # --> C(index, i)
end

def get_row_another(index)
  result = Array.new(index + 1, 1)
  1.upto((index + 1) / 2) do |i|
    result[i] = result[index - i] = result[i - 1] * (index - i + 1) / i
  end
  result
end
