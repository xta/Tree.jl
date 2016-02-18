# set / get Node value

a_node = Tree.Node("some_value")
@test a_node.value == "some_value"

another_node = Tree.Node("different_value")
@test another_node.value == "different_value"

@test a_node.value == "some_value"

# set Node children & parent

parent_node = Tree.Node("parent")
child_node = Tree.Node("child_1")
Tree.add_children(parent_node, [child_node])

@test length(parent_node.children) == 1

another_child_node = Tree.Node("child_2")
third_child_node = Tree.Node("child_3")
Tree.add_children(parent_node, [another_child_node, third_child_node])

@test length(parent_node.children) == 3

# get Node children

@test parent_node.children == [child_node, another_child_node, third_child_node]

# get Node parent

@test get(child_node.parent) == parent_node
@test get(another_child_node.parent) == parent_node
@test get(third_child_node.parent) == parent_node

# check if Node is leaf (no children)

@test Tree.is_leaf(child_node) == true
@test Tree.is_leaf(parent_node) == false

# check if Node is root (no parent)

@test Tree.is_root(parent_node) == true
@test Tree.is_root(child_node) == false

# check if Node is ancestor (above/parent) of other Node

grandchild_node = Tree.Node("grandchild")
Tree.add_children(child_node, [grandchild_node])

@test Tree.is_ancestor(parent_node, child_node) == true
@test Tree.is_ancestor(parent_node, grandchild_node) == true
@test Tree.is_ancestor(child_node, grandchild_node) == true

@test Tree.is_ancestor(child_node, parent_node) == false
@test Tree.is_ancestor(grandchild_node, parent_node) == false
@test Tree.is_ancestor(grandchild_node, child_node) == false

# check if Node is descendant (below/child) of other Node

@test Tree.is_descendant(child_node, parent_node) == true
@test Tree.is_descendant(grandchild_node, parent_node) == true
@test Tree.is_descendant(grandchild_node, child_node) == true

@test Tree.is_descendant(parent_node, child_node) == false
@test Tree.is_descendant(parent_node, grandchild_node) == false
@test Tree.is_descendant(child_node, grandchild_node) == false

# check if Node is sibling (same parent) of other Node

@test Tree.is_sibling(child_node, another_child_node) == true
@test Tree.is_sibling(child_node, third_child_node) == true
@test Tree.is_sibling(another_child_node, third_child_node) == true

@test Tree.is_sibling(child_node, grandchild_node) == false
@test Tree.is_sibling(parent_node, grandchild_node) == false

grand_grandchild_node_1 = Tree.Node("grand_grandchild_node_1")
grand_grandchild_node_2 = Tree.Node("grand_grandchild_node_2")
Tree.add_children(grandchild_node, [grand_grandchild_node_1, grand_grandchild_node_2])

grand_grand_grandchild_node_1 = Tree.Node("grand_grand_grandchild_node_1")
Tree.add_children(grand_grandchild_node_1, [grand_grand_grandchild_node_1])

#                       parent
#     child_node, another_child_node, third_child_node
# grandchild_node
# ggc1      ggc2
# gggc1

# get depth (node to top)

@test Tree.depth(parent_node) == 0
@test Tree.depth(child_node) == 1
@test Tree.depth(another_child_node) == 1
@test Tree.depth(grandchild_node) == 2
@test Tree.depth(grand_grandchild_node_1) == 3
@test Tree.depth(grand_grandchild_node_2) == 3
@test Tree.depth(grand_grand_grandchild_node_1) == 4

# get height (node to bottom)

@test Tree.height(parent_node) == 4
@test Tree.height(child_node) == 3
@test Tree.height(another_child_node) == 0
@test Tree.height(third_child_node) == 0
@test Tree.height(grandchild_node) == 2
@test Tree.height(grand_grandchild_node_1) == 1
@test Tree.height(grand_grandchild_node_2) == 0
@test Tree.height(grand_grand_grandchild_node_1) == 0

