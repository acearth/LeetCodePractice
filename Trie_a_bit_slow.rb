class TrieNode
    attr_accessor :state, :values, :val

      def initialize
            @val=nil
                @state=0 # is prefix
                    @values=[]
                      end

        def insertChar(word)
              if word.size==0
                      @state=1
                          else
                                  parent=nil
                                        @values.each { |p| (parent=p; break) if p.val==word[0] }
                                              if parent==nil
                                                        parent=TrieNode.new
                                                                parent.val=word[0]
                                                                        @values.push(parent)
                                                                              end
                                                    parent.insertChar(word[1..-1])
                                                        end
                end

          def searchChar(word)
                if word.size==0
                        return @state
                            else
                                    parent=nil
                                          @values.each { |p| (parent=p; break) if p.val==word[0] }
                                                return false if parent==nil
                                                      return parent.searchChar(word[1..-1])
                                                          end
                  end
end

class Trie
    def initialize
          @root = TrieNode.new
            end

      def getParent(ch)
            @root.values.each { |p| return p if p.val==ch }
                nil
                  end

        def insert(word)
              parent=getParent(word[0])
                  if parent==nil
                          parent=TrieNode.new
                                parent.val=word[0]
                                      @root.values.push parent
                                          end
                      parent.insertChar(word[1..-1])
                        end

          def search(word)
                parent=getParent(word[0])
                    return false if parent==nil
                        t = parent.searchChar(word[1..-1])
                            return t if t==false
                                t==1
                                  end

            def starts_with(prefix)
                  parent=getParent(prefix[0])
                      return false if parent==nil
                          t = parent.searchChar(prefix[1..-1])
                              return t if t==false
                                  true
                                    end
end
w1='abc'
w2='ace'
t=Trie.new
t.insert(w1)
p t.search(w1)
p t.search(w2)
t.insert(w2)
p t.search(w1)
p t.search(w2)
p t.starts_with('ab')
p t.starts_with('abc')


