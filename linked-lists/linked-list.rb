
# time: linear, space: constant
def print(head)
  current = head
  until current.value == nil
    print current.value
    current = current.next
  end
end

# time: linear, space: constant
def max(head)
  max = head.value
  current = head
  until current.value == nil
    if current.value > max
      max = current.value
    end
    current = current.next
  end
  return max
end

# time: linear, space: constant
def delete(value, head)
  if head.value == value
    head = head.next
    return
  end
  previous = head
  current = head.next
  until current.value == nil
    if current.value == value
      previous.next = current.next
    end
    previous = current
    current = current.next
  end
end

# assume data is sorted in asscending order, insert node with value 999
# time: linear, space: constant

def insert(node, head)
  if node.value < head.value
    node.next = head
    head = node
    return
  end
  current = head
  until current.value == nil
    if node.value < current.next
      node.next = current.next
      current.next = node
      return
    end
    current = current.next
  end
  current.next = node
  node.next = nil
end

# time: linear, space: constant
def empty(head)
  current = head
  until current.next.value == nil
    temp = current.next
    current = temp
    current.delete
  end
  head = nil;
end
