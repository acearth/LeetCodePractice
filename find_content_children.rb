# Q-455: greeding
def find_content_children(g, s)
  g, s = g.sort, s.sort
  i = j = 0
  while i < g.size && j < s.size
    j += 1 while j < s.size && s[j] < g[i]
    i, j = i + 1, j + 1 if s[j] && s[j] >= g[i]
  end
  i
end
