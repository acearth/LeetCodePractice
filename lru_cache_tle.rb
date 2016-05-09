require 'set'

# FIXME: a time exceed solution!
# This class is last recent used cache
class LRUCache
  def initialize(capacity)
    @store = []
    @capacity = capacity
    @keys = Set.new
  end

  def get(key)
    return -1 unless @keys.include? key
    target = @store.select { |k, _| k == key }.flatten
    @store.delete(target)
    @store.unshift(target)
    @store.first.last
  end

  def set(key, value)
    current = [key, value]
    if @keys.include? key
      @store.each { |k, v| @store.delete([k, v]) && break if k == key }
      @keys.delete(key)
    end
    @store.unshift current
    @keys << key
    @keys.delete @store.delete_at(-1).first if @store.size > @capacity
  end
end
