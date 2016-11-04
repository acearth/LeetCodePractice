def flatten(tree)
    return unless tree
    r_tail = flatten(tree.right)
    (l_tail = flatten(tree.left)) && l_tail.right = tree.right
    (tree.right = tree.left) && tree.left = nil if tree.left
    r_tail || l_tail || tree
end
