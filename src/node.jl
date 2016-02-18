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

# check if 1st node (possible_ancestor) is ancestor (older) of 2nd node (possible_descendant)
function is_ancestor(possible_ancestor::Node, possible_descendant::Node)
  if isnull(possible_descendant.parent)
    return false
  elseif get(possible_descendant.parent) == possible_ancestor
    return true
  else
    is_ancestor(possible_ancestor, get(possible_descendant.parent))
  end
end

# check if 1st node (possible_descendant) is descendant (younger) of 2nd node (possible_ancestor)
function is_descendant(possible_descendant::Node, possible_ancestor::Node)
  is_ancestor(possible_ancestor, possible_descendant)
end

# check if 1st node (possible_sibling) is a sibling (same parents) of 2nd node (check_node)
function is_sibling(possible_sibling::Node, check_node::Node)
  if isnull(possible_sibling.parent)
    return false
  else
    parent = get(possible_sibling.parent)
    if length(parent.children) <= 0
      return false
    else
      return in(check_node, parent.children)
    end
  end
end
