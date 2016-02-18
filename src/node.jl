type Node
  value
  parent::Nullable
  children::Array
end

# Outer Constructor Method for convenience
Node(v) = Node(v, Nullable{Node}(), Array(Node, 0))

# methods

function add_children(parent::Node, children::Array)
  for child in children
    child.parent = Nullable(parent)
    push!(parent.children, child)
  end
end

function is_leaf(node::Node)
  length(node.children) <= 0
end

function is_root(node::Node)
  isnull(node.parent)
end
