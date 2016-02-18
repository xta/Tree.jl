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
