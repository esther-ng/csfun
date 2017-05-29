class TreeNode
  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end

## Shruti: Recommend since your are using an object oriented programming language, make your design object oriented.
##         You can make all the following method be part of a class, say BinarySearchTree.
##         The BinarySearchTree class will have one attr_accessor for the root, and root won't need to be passed to the methods.

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def inorder(node=@root)
    return if node.nil?
    inorder(node.left)
    print node.value
    inorder(node.right)
  end

  def inorder_i(node)
    return if node.nil?
    stack = []
    current = node
    until current.nil? && stack.empty?
      if current
        stack.push(current)
        current = current.left
      else
        current = stack.pop
        print current.value
        current = current.right
      end
    end
  end

  def postorder(node)
    return if node.nil?
    postorder(node.left)
    postorder(node.right)
    print node.value
  end

  def preorder(node)
    return if node.nil?
    print node.value
    preorder(node.left)
    preorder(node.right)
  end

  def preorder_i(node)
    stack = [] #only push/pop/empty/top/size
    stack.push(node)
    until stack.empty?
      popped = stack.pop
      print popped.value
      stack.push(popped.right) if popped.right
      stack.push(popped.left) if popped.left
    end
  end

  def breadth(root)
    (1..find_height(root)).each do |i|
      printLevel(i, root)
    end
  end

  def printLevel(i, root)
    return if root.nil?
    if i == 1
      print(root.value)
    else
      printLevel(i - 1, root.left)
      printLevel(i - 1, root.right)
    end
  end

  def find_height(root)
    return 0 if root.nil?
    left_height = find_height(root.left)
    right_height = find_height(root.right)
    if left_height > right_height
      return left_height + 1
    else
      return right_height + 1
    end
  end

  def has_value?(value, node)
    return false if node.nil?
    return true if node.value == value
    if value < node.value
      has_value?(value, node.left)
    else
      has_value?(value, node.right)
    end
  end

  def has_value_i?(value, node)
    current = node
    until current.nil?
      return true if current.value == value
      if value < current.value
        current = current.left
      else
        current = current.right
      end
    end
    return false
  end

  def find_node(value, node)
    return nil if node.nil?
    return node if node.value == value
    if value < node.value
      find_node(value, node.left)
    else
      find_node(value, node.right)
    end
  end

  def insert_node(value)
    new = TreeNode.new(value)
    if @root.nil?
      @root = new
      return
    end
    ## Shruti: Bug: If root is nil for the first call into the algorithm, it means you're starting with an empty tree.
    ## Shruti: In this case, the value to be inserted should become the first node in the tree - update root with this value.
    if value <= @root.value
      insert_node(value, root.left)
      root.left = TreeNode.new(value) if root.left.nil?
  	## Shruti: Pedantic; This could be improved to avoid unnecessary recursive no-op call, and provide better readability like so:
  	## if root.left.nil
  	##		root.left = TreeNode.new(value)
  	## else
  	##		insert_node(value, root.left)
      ## end
    else
      insert_node(value, root.right)
      root.right = TreeNode.new(value) if root.right.nil?
  	## Shruti: Similar comment as for left subtree above.
    end
  end

  def insert_node_i(value, root)
    node = TreeNode.new(value)
    if root.nil?
      root = node
      return
    end
    parent = nil
    current = root
    until current.nil?
      parent = current
      if value <= current.value
        current = parent.left
      else
        current = parent.right
      end
    end
    if value <= parent.value
      parent.left = node
    else
      parent.right = node
    end
  end

  ## Shruti: If you're only ever using this method from delete_node, that'd work.
  ## Shruti: Otherwise, there's a bug: What if root is nil? In that case, you are trying to do a .left operation on nil
  def find_lowest(root)
    current = root
    until current.left.nil?
      current = current.left
    end
    return current
  end

  def delete_node (value, node)
    return nil if node.nil?
    if node.left.value == value
        if node.left.left.nil? && node.left.right.nil?
          node.left = nil
        elsif node.left.left.nil? && !node.left.right.nil?
          node.left = node.left.right
        elsif node.left.right.nil? && !node.left.left.nil?
          node.left = node.left.left
        else
          node.left = find_lowest(node.left) ##Shruti: This should be the in-order successor of node.left, so you'll need to call find_lowest(node.left.right)
  		## Shruti: This will need to be followed by a delete_node call
  		## Here's what this should look like:
  		##   temp = find_lowest(node.left.right)
  		##   node.left.value = temp.value
  		##   delete_node(node.left.right, temp.value)
  		## Without the recursive delete call, you've really just duplicated a value (in-order successor value) to be in the node to be deleted or modified the tree much more than you intended too.
  		## Try walking through this in a larger tree with a middle level node to be deleted.
        end
        return node
    elsif node.right.value == value
      if node.right.left.nil? && node.right.right.nil?
        node.right = nil
      elsif node.right.left.nil? && !node.right.right.nil?
        node.right = node.left.right
      elsif node.right.right.nil? && !node.right.left.nil?
        node.right = node.right.left
      else
        node.right = find_lowest(node.right)
  	  ## Shruti: Similar comment as above on finding the in-order successor and then recusively calling delete_node
      end
      return node
    end
    if value < node.value
      return delete_node(value, node.left)
    end
    return delete_node(value, node.right)
  end
end

root = TreeNode.new(5)
root.left = TreeNode.new(3)
root.left.left = TreeNode.new(2)
root.left.left.left = TreeNode.new(1)
root.left.right = TreeNode.new(4)
root.right = TreeNode.new(8)
root.right.left = TreeNode.new(7)
root.right.right = TreeNode.new(9)

puts "preorder"
preorder(root)
puts
puts "preorder_i"
preorder_i(root)
puts
puts "inorder"
inorder(root)
puts
puts "inorder_i"
inorder_i(root)
puts
puts "postorder"
postorder(root)
puts
puts "breadth"
breadth(root)
puts
