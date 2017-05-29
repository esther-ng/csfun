def add(node, head)
  head.previous = node
  node.next = head
  head = node
end

def remove_first(head)
  first = head
  head.next.previous = nil
  head = head.next
  free(first)
end

def add_as_second(node, head)
  node.next = head.next
  node.next.previous = node
  node.previous = head
  head.next = node
end

def remove_second(head)
  second = head.next
  second.next.previous = head
  head.next = second.next
  free(second)
end
