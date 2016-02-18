type Node
  value
  children::Array
end

# Outer Constructor Method for convenience
Node(v) = Node(v, Array(Node, 0))
