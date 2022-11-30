# Q-399 graph path search
# 30/nov/2022
# @param {String[][]} equations
# @param {Float[]} values
# @param {String[][]} queries
# @return {Float[]}
def calc_equation(equations, values, queries)
  key = {}
  equations.each do |p, q|
    key[p] ||= key.size
    key[q] ||= key.size
  end
  len = key.size
  matrix = len.times.map { [2 ** 32] * len }
  equations.each_with_index do |eq, i|
    p, q = key[eq[0]], key[eq[1]]
    matrix[p][q] = values[i]
    matrix[q][p] = 1.0 / values[i]
  end
  queries.map do |a, b|
    p, q = key[a], key[b]
    p && q ? dfs(1.0, {}, p, q, key.size, matrix) : -1
  end
end

def dfs(acc, visited, cur, target, size, matrix)
  return acc if target == cur
  size.times do |k|
    next if visited[k] || matrix[cur][k] == 2 ** 32
    visited[cur] = true
    got = dfs(acc * matrix[cur][k], visited, k, target, size, matrix)
    return got if got != -1
    visited[cur] = false
  end
  -1.0
end

# path search in Floyd-Warshall
def calc_equation(equations, values, queries)
  key = {}
  equations.each do |p, q|
    key[p] ||= key.size
    key[q] ||= key.size
  end
  len = key.size
  matrix = len.times.map { [2 ** 32] * len }
  equations.each_with_index do |eq, i|
    p, q = key[eq[0]], key[eq[1]]
    matrix[p][q] = values[i]
    matrix[q][p] = 1.0 / values[i]
  end
  len.times do |k|
    len.times do |i|
      len.times do |j|
        next if matrix[i][k] == 2 ** 32 || matrix[k][j] == 2 ** 32
        matrix[i][j] = [matrix[i][j], matrix[i][k] * matrix[k][j]].min
      end
    end
  end
  queries.map do |a, b|
    p, q = key[a], key[b]
    p && q && matrix[p][q] != 2 ** 32 ? matrix[p][q] : -1.0
  end
end