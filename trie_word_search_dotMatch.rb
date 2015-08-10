class TrieNode
  attr_accessor :state, :values, :val, :valuesHash

  def initialize
    @val=nil
    @state=0 # 0 stands for prefix
    @values=[]
    @valuesHash=Hash.new
  end

  def insertChar(word)
    if word.size==0
      @state=1
    else
      parent=@valuesHash[word[0]]
      if parent==nil
        parent=TrieNode.new
        parent.val=word[0]
        @values.push(parent)
        @valuesHash[word[0]]=parent
      end
      parent.insertChar(word[1..-1])
    end
  end

  def searchChar(word)
    if word.size==0
      return @state
    else
      parent=@valuesHash[word[0]]
      return false if parent==nil
      return parent.searchChar(word[1..-1])
    end
  end
end

class WordDictionary
  def initialize
    @root = TrieNode.new
  end

  def add_word(word)
    parent=@root.valuesHash[word[0]]
    if parent==nil
      parent=TrieNode.new
      parent.val=word[0]
      @root.values.push parent
      @root.valuesHash[word[0]]=parent
    end
    parent.insertChar(word[1..-1])
  end

  def search(word)
    result=[]
    dfs(@root, word, result)
    result.size>0
  end

end

def dfs(trieNode, str, result)
  if str.size==0 && trieNode.state==1
    result<<"true"
  elsif str[0]=='.'
    trieNode.values.each { |p| dfs(p, str[1..-1], result) }
  else
    parent=trieNode.valuesHash[str[0]]
    dfs(parent, str[1..-1], result) if parent!=nil
  end
end

w1='abc'
w2='ace'
t=WordDictionary.new
t.add_word(w1)
t.add_word(w2)
p t.search(w1)
p t.search(w2)
puts
p t.search("a.c")
p t.search("ac.")
p t.search(".ce")


