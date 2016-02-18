# set / get Node value

a_node = Tree.Node("some_value")
@test a_node.value == "some_value"

another_node = Tree.Node("different_value")
@test another_node.value == "different_value"

@test a_node.value == "some_value"

# set / get Node children

parent_node = Tree.Node("parent")
child_node = Tree.Node("child_1")
push!(parent_node.children, child_node)

@test length(parent_node.children) == 1

another_child_node = Tree.Node("child_2")
push!(parent_node.children, another_child_node)

@test length(parent_node.children) == 2
