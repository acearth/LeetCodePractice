class BSTIterator
    def initialize(root)
        @stack = []
        add(root)
    end

    def has_next
        @stack.any?
    end

    def next
        node = @stack.pop
        add(node.right)
        node.val 
    end
    
    private
    def add(node)
        @stack << node && node = node.left while node
    end
end
