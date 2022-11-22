# Q-210: topological sort
# @created: 22/nov/2022
#
# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
  indegrees = num_courses.times.map { |i| [i, 0] }.to_h
  edges = Hash.new { |h, k| h[k] = [] }
  prerequisites.each do |to, from|
    edges[from] << [from, to]
    indegrees[to] += 1
  end
  result = []
  while num_courses > 0
    course, _ = indegrees.find { |_, degree| degree == 0 }
    return [] unless course
    indegrees.delete(course)
    result << course
    edges[course].each { |_, to| indegrees[to] -= 1 }
    num_courses -= 1
  end
  result
end