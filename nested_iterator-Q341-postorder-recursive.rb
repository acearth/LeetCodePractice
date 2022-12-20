# Q-341: recursive solution for multi-kids tree post order transverse
# 20/dec/2022
class NestedIterator
  # @param {NestedInteger[]} nested_list
  def initialize(nested_list)
    @element = trans(nested_list)
    @cur = -1
  end

  def trans(e)
    if e.class == Array
      e.reduce([]) { |acc, element| acc + trans(element) }
    else
      e.is_integer ? [e.get_integer] : e.get_list.reduce([]) { |acc, element| acc + trans(element) }
    end
  end

  def has_next
    @cur + 1 != @element.size
  end

  def next
    @element[@cur += 1]
  end
end