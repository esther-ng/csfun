
class Trie
  attr_accessor :root

  def initialize
    @root = TrieNode.new
  end

  class TrieNode
    attr_accessor :end_of_word, :children, :size
    def initialize
      @children = {}
      @end_of_word = false
      @size = 0
    end
  end

  def insert(word)
    children = @root.children
    node = nil
    word.each_char do |c|
      if children.has_key?(c)
        node = children[c]
      else
        node = children[c] = TrieNode.new
      end
      node.size += 1
      children = node.children
    end
    node.end_of_word = true
  end

  def search(word)
    children = @root.children
    word.each_char do |c|
      unless children.has_key?(c)
        return false
      end
      children = children[c].children
    end
    return children.empty?
  end

  def starts_with(prefix)
    count = 0
    children = @root.children
    node = nil
    prefix.each_char do |c|
      unless children.has_key?(c)
        return 0
      end
      node = children[c]
      children = node.children
    end
    if children.empty?
      return 1
    else
      return node.size
      # return count_children(children)
    end
  end

  def count_children(children)
    if children.empty?
      return 0
    else
      count = 0
      children.each do |k, v|
        count += 1 if v.end_of_word
        count += count_children(v.children)
      end
      return count
    end
  end

end
