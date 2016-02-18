# set / get Node value

a_node = Tree.Node("some_value")
@test a_node.value == "some_value"

another_node = Tree.Node("different_value")
@test another_node.value == "different_value"

@test a_node.value == "some_value"
