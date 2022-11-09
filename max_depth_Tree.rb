# Q-104
def max_depth(root)
    return 0 unless root
    [max_depth(root.left), max_depth(root.right)].max + 1
end

def max_depth(root)
    result = 0
    q = [root]
    while q.any?
        q=q.map{|t|[t.left,t.right].compact}.flatten
        result +=1
    end
    result
end
