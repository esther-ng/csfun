def equal? (a, b, c)
  if a == b && b == c
    return false
  end

  if a == b || b == c || a == c
    return is_triangle?(a, b, c)
  end

  return false

end

def is_triangle? (a, b, c)
  (a > 0 || b > 0 || c > 0 ) && a + b > c && a + c > b && b + c > a ? true : false
end
