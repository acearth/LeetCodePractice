def binary_tree_paths(tree)
  return [] if not tree
  res=binary_tree_paths(tree.left) + binary_tree_paths(tree.right)
  return ["#{tree.val}"] if res.size==0
  prefix="#{tree.val}->"
  res.map{|sub| prefix+sub }
end
